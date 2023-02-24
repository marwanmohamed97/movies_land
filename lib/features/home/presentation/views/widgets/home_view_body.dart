import 'package:flutter/material.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/features/home/presentation/views/widgets/custom_search_button.dart';

import 'custom_app_bar.dart';
import 'featured_box.dart';
import 'featured_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: const [
                  SizedBox(
                    height: 32,
                  ),
                  CustomAppBar(),
                  SizedBox(
                    height: 38,
                  ),
                  CustomSearchButton(),
                  SizedBox(
                    height: 24,
                  ),
                  FeaturedBox(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const FeaturedSection(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Movies Land Picks',
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FeaturedSection(
                    width: 112,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Just Added',
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const FeaturedSection(
                    width: 112,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
