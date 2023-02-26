import 'package:flutter/material.dart';
import 'package:movies_land/core/ulits/styles.dart';

class CustomErrorView extends StatelessWidget {
  const CustomErrorView({Key? key, required this.errMessage}) : super(key: key);

  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          errMessage,
          style: Styles.textStyle16,
        ),
      ),
    );
  }
}
