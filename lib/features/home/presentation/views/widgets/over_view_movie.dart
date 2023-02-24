import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';

class OverViewMovie extends StatelessWidget {
  const OverViewMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/movie_title_image.png',
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Image.asset('assets/images/tomato.png'),
            const SizedBox(
              width: 8,
            ),
            Text(
              '98%',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Drama - 1 season',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          'Blessed with an extraordinary ability to determine when someone is lying, Charlie Cale investigates crimes she encounters on the road.',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
