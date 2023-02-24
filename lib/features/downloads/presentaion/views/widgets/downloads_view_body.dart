import 'package:flutter/material.dart';
import 'package:movies_land/core/ulits/styles.dart';

class DownlaodsViewBody extends StatelessWidget {
  const DownlaodsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Center(
          child: Column(
            children: const [
              Text(
                'Downloads',
                style: Styles.textStyle34,
              )
            ],
          ),
        ),
      ),
    );
  }
}
