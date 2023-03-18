import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';
import 'package:movies_land/core/widgets/custom_text_field.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  String? email;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
              Text(
                'Forget your Password ?',
                style: Styles.textStyle34.copyWith(fontSize: 28),
              ),
              Text(
                textAlign: TextAlign.center,
                'Enter your email address to change your password',
                style: Styles.textStyle16.copyWith(color: kPrimaryColor),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                controller: _emailController,
                onChanged: (value) {
                  email = value;
                },
                hintText: 'Email',
                prefixIcon: Icons.mail,
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(
                onpressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child:
                                CircularProgressIndicator(color: kPrimaryColor),
                          );
                        },
                      );
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email!);
                      _emailController.clear();
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Password Reset Email Sent')),
                      );
                    } on Exception catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                textColor: Colors.black,
                buttonContent: 'SEND',
                backgroundColor: kPrimaryColor,
              ),
              const SizedBox(
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
