import 'package:flutter/material.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.backgroundColor,
      required this.textColor,
      required this.onpressed,
      required this.buttonContent,
      this.isSginOut = false})
      : super(key: key);

  final Color? backgroundColor;
  final Color textColor;
  final String buttonContent;
  final bool isSginOut;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 61,
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: textColor),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: isSginOut == true
                ? const BorderSide(
                    width: 1, color: kPrimaryColor, style: BorderStyle.solid)
                : const BorderSide(),
          ),
        ),
        child: Text(
          buttonContent,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
