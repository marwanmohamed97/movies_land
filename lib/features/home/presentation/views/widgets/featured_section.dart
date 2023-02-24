import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/core/ulits/app_router.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({Key? key, this.width = 295}) : super(key: key);

  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.movieDetailsView);
      },
      child: SizedBox(
        height: 166,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: width,
                child: Image.asset(
                  'assets/images/featured_image.png',
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
