import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';
import 'package:movies_land/features/home/presentation/views/home_view.dart';

import '../../../../core/widgets/custom_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return CustomGeneralView(
      widget: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Login',
              style: Styles.textStyle34,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
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
              hintText: 'Password',
              prefixIcon: Icons.lock,
              suffixIcon: Icons.remove_red_eye,
              isPassword: true,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.forgetPasswordView);
                },
                child: Text(
                  'Forget Password',
                  style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onpressed: () async {
                try {
                  final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.toString(),
                    password: password.toString(),
                  );
                  kEmail = email;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Success Login')),
                  );
                  GoRouter.of(context).push(AppRouter.homeView);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('No user found for that email.')),
                    );
                  } else if (e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Wrong password.')),
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
              textColor: Colors.black,
              buttonContent: 'LOGIN',
              backgroundColor: kPrimaryColor,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New to movies land?',
                  style: Styles.textStyle16,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.signUpView);
                  },
                  child: Text(
                    ' Sign up',
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
    );
  }
}
