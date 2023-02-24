import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';

class FeaturedBox extends StatelessWidget {
  const FeaturedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'featured',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Movies',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        Text(
          'TV Shows',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        Text(
          'Sports',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        Text(
          'WWE',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
