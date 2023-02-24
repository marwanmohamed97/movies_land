import 'package:flutter/material.dart';

import '../../../../../constats.dart';
import '../../../../../core/ulits/styles.dart';

class PlayMovieSection extends StatelessWidget {
  const PlayMovieSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 115,
          height: 61,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 32,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'PLAY',
                style: Styles.textStyle14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }
}
