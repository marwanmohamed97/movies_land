import 'package:flutter/material.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.backgroundColor,
      required this.textColor,
      required this.buttonContent,
      this.isSginOut = false})
      : super(key: key);

  final Color? backgroundColor;
  final Color textColor;
  final Widget buttonContent;
  final bool isSginOut;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 61,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: isSginOut == true
                ? const BorderSide(
                    width: 1, color: kPrimaryColor, style: BorderStyle.solid)
                : const BorderSide(),
          ),
        ),
        child: buttonContent,
      ),
    );
  }
}
