import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/core/widgets/custom_button.dart';
import 'package:movies_land/features/home/presentation/views/widgets/play_movie_section.dart';
import 'package:movies_land/features/home/presentation/views/widgets/season_section.dart';

import '../../../../../core/widgets/custom_drop_down_button.dart';
import 'over_view_movie.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/images/movie_background.png'),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withOpacity(.8),
                              Colors.black,
                              Colors.black,
                              Colors.black,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 36,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              //color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 205,
                        ),
                        const OverViewMovie(),
                        const SizedBox(
                          height: 32,
                        ),
                        const PlayMovieSection(),
                        const SizedBox(
                          height: 32,
                        ),
                        const SeasonSection(),
                        const SizedBox(
                          height: 24,
                        ),
                        const EpisodesOfMovie(),
                        const SizedBox(
                          height: 16,
                        ),
                        const EpisodesOfMovie(),
                        const SizedBox(
                          height: 16,
                        ),
                        const EpisodesOfMovie(),
                        const SizedBox(
                          height: 16,
                        ),
                        const EpisodesOfMovie(),
                        const SizedBox(
                          height: 16,
                        ),
                        const EpisodesOfMovie(),
                        const SizedBox(
                          height: 16,
                        ),
                        const EpisodesOfMovie(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EpisodesOfMovie extends StatelessWidget {
  const EpisodesOfMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          Container(
            width: 112,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: kPrimaryColor),
            child: Image.asset(
              'assets/images/movie_background.png',
              fit: BoxFit.cover,
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
    );
  }
}
