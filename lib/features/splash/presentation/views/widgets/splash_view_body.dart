import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/core/ulits/app_router.dart';
import 'package:movies_land/core/widgets/custom_general_view.dart';

import '../../../../../constats.dart';
import '../../../../../core/ulits/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGeneralView(
      isscrollable: false,
      widget: Column(
        children: [
          const Text(
            'Bingeworthy TV, hit movies, live sports & so much more',
            style: Styles.textStyle34,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 56,
          ),
          CustomButton(
            onpressed: () {},
            backgroundColor: kButtonColor,
            textColor: Colors.black,
            buttonContent: 'GET STARTED',
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.logInView);
              //GoRouter.of(context).go('l');
            },
            child: const Text(
              'Skip',
              style: Styles.textStyle16,
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
