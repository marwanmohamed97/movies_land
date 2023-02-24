import 'package:flutter/material.dart';

import '../../../../../constats.dart';
import '../../../../../core/ulits/styles.dart';

class EpisodesOfMovie extends StatelessWidget {
  const EpisodesOfMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            width: double.infinity,
            height: 150,
            child: Row(
              children: [
                Container(
                  width: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/episode.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dead Man’s Hand',
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Episode 1 - 1h 7m',
                        style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(.6)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'When her friend is murdered, Charlie Cale, a woman with a knack for identifying lies, investigates.',
                        style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(.87)),
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        maxLines: 4,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Download and watch offline',
                        style: TextStyle(
                            fontSize: 12,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
