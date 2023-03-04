import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';
import 'package:movies_land/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_land/features/home/presentation/views/widgets/recommended_movies.dart';
import '../../../../../core/ulits/styles.dart';
import '../../manager/movie_actors_cubit/movie_actros_cubit.dart';
import '../../manager/recommended_movies_cubit/recommended_movies_cubit.dart';
import 'movie_actors.dart';

class RecommendedOrActors extends StatefulWidget {
  const RecommendedOrActors({
    super.key,
    required this.movieID,
  });
  final int movieID;
  @override
  State<RecommendedOrActors> createState() => _RecommendedOrActorsState();
}

class _RecommendedOrActorsState extends State<RecommendedOrActors> {
  bool isRecommended = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                isRecommended = true;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'More like this',
                  style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isRecommended == true
                          ? Colors.white
                          : Colors.white.withOpacity(0.32)),
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            GestureDetector(
              onTap: () {
                isRecommended = false;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Actors',
                  style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w400,
                      color: isRecommended == true
                          ? Colors.white.withOpacity(0.32)
                          : Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        isRecommended == true
            ? BlocProvider(
                create: (context) =>
                    RecommendedMoviesCubit(getIt.get<HomeRepoImpl>())
                      ..fetchRecommendedMovies(movieId: widget.movieID),
                child: const RecommendedMovies(),
              )
            : BlocProvider(
                create: (context) =>
                    MoviesDetailsCubit(getIt.get<HomeRepoImpl>())
                      ..fetchMovieActors(movieId: widget.movieID),
                child: const MovieActors(),
              )
      ],
    );
  }
}
