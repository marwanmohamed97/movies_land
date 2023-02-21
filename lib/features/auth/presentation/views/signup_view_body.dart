import 'package:flutter/material.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';

import '../../../../constats.dart';
import '../../../../core/ulits/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGeneralView(
      backgroundColor: true,
      widget: Column(
        children: [
          const Text(
            'SignUp',
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
            child: Text(
              'Forget Password',
              style: Styles.textStyle16.copyWith(color: kPrimaryColor),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const CustomButton(
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
              Text(
                ' Sign up',
                style: Styles.textStyle16.copyWith(color: kPrimaryColor),
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
