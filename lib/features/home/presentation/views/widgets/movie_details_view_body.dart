import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/presentation/views/widgets/play_movie_section.dart';
import 'package:movies_land/features/home/presentation/views/widgets/season_section.dart';
import 'episodes_of_movie.dart';
import 'over_view_movie.dart';

class MovieDetailsViewBody extends StatefulWidget {
  const MovieDetailsViewBody({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieDetailModel movie;

  @override
  State<MovieDetailsViewBody> createState() => _MovieDetailsViewBodyState();
}

class _MovieDetailsViewBodyState extends State<MovieDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(imageUrlMaker(imageUrl: widget.movie.backdropPath!)),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 205,
                        ),
                        OverViewMovie(movies: widget.movie),
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
                        const EpisodesOfMovie()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
