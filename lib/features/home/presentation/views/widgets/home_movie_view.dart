import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';
import 'custom_app_bar.dart';
import 'custom_search_button.dart';
import 'featured_box.dart';
import 'featured_section.dart';

class HomeMovieView extends StatelessWidget {
  const HomeMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
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
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
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
    );
  }
}
