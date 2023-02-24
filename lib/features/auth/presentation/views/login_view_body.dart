import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';

import '../../../../core/widgets/custom_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGeneralView(
      widget: Column(
        children: [
          const Text(
            'Login',
            style: Styles.textStyle34,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hintText: 'Email',
            prefixIcon: Icons.mail,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
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
          const CustomButton(
            textColor: Colors.black,
            buttonContent: Text('LOGIN'),
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
    );
  }
}
