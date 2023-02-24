import 'package:flutter/material.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';
import 'package:movies_land/core/widgets/custom_text_field.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGeneralView(
      backgroundColor: true,
      widget: Column(
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
            hintText: 'Email',
            prefixIcon: Icons.mail,
          ),
          const SizedBox(
            height: 150,
          ),
          const CustomButton(
            textColor: Colors.black,
            buttonContent: Text('SEND'),
            backgroundColor: kPrimaryColor,
          ),
          const SizedBox(
            height: 56,
          ),
        ],
      ),
    );
  }
}
