import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';
import '../../../../../core/widgets/custom_drop_down_button.dart';

class SeasonSection extends StatelessWidget {
  const SeasonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Episodes',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              'More like this',
              style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.32)),
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              'Extras',
              style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.32)),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const CustomDropDownButton(),
      ],
    );
  }
}
