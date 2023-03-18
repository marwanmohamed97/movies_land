import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';

import '../../../../constats.dart';
import '../../../../core/ulits/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? email, password, rePassword;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomGeneralView(
      backgroundColor: true,
      widget: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'SignUp',
                style: Styles.textStyle34,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                onChanged: (data) {
                  email = data;
                },
                isPassword: false,
                controller: _nameController,
                hintText: 'Full Name',
                prefixIcon: Icons.person,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onChanged: (data) {
                  email = data;
                },
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: Icons.mail,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onChanged: (data) {
                  password = data;
                },
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.remove_red_eye,
                isPassword: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: _repasswordController,
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.remove_red_eye,
                isPassword: true,
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onpressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_passwordController.text.trim() ==
                        _repasswordController.text.trim()) {
                      try {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: kPrimaryColor),
                            );
                          },
                        );
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email.toString(),
                          password: password.toString(),
                        );
                        Navigator.of(context).pop();
                        final name =
                            FirebaseFirestore.instance.collection('names');
                        name
                            .doc(email)
                            .set({'Full_Name': _nameController.text.trim()});

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Success Signup')),
                        );
                        GoRouter.of(context).push(AppRouter.logInView);
                      } on FirebaseAuthException catch (e) {
                        Navigator.of(context).pop();
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('The password provided is too weak.')),
                          );
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'The account already exists for that email.')),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'ReEnter The Password it\'s not Correct ')),
                      );
                    }
                  }
                },
                textColor: Colors.white,
                buttonContent: 'SignUp',
                backgroundColor: kPrimaryColor,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an acount?',
                    style: Styles.textStyle16,
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.logInView);
                    },
                    child: Text(
                      ' Login',
                      style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
