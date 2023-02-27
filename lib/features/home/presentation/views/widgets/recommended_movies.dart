import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/features/home/presentation/views/widgets/recommended_movies_body.dart';

import '../../manager/recommended_movies_cubit/recommended_movies_cubit.dart';

class RecommendedMovies extends StatefulWidget {
  const RecommendedMovies({Key? key, required this.movieID}) : super(key: key);

  final int movieID;
  @override
  State<RecommendedMovies> createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedMoviesCubit, RecommendedMoviesState>(
      builder: (context, state) {
        if (state is RecommendedMoviesSuccess) {
          return RecommendedMoviesBody(
            movies: state.movies,
          );
        } else if (state is RecommendedMoviesfailure) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Center(
                child: Text(
              'There is no recommendations',
              style: Styles.textStyle16,
            )),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
