import 'package:flutter/material.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';

import '../../../../../constats.dart';
import '../../../../../core/ulits/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGeneralView(
      widget: Column(
        children: const [
          Text(
            'Bingeworthy TV, hit movies, live sports & so much more',
            style: Styles.textStyle34,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 56,
          ),
          CustomButton(
            backgroundColor: kButtonColor,
            textColor: Colors.black,
            buttonContent: 'GET STARTED',
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Skip',
            style: Styles.textStyle16,
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
