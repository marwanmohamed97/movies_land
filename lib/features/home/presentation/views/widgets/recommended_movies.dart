import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/ulits/styles.dart';
import 'package:movies_land/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_land/features/home/presentation/views/widgets/recommended_movies_body.dart';

import '../../manager/recommended_movies_cubit/recommended_movies_cubit.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedMoviesCubit, RecommendedMoviesState>(
      // buildWhen: (previous, current) => current is MoviesDetailsSuccess,
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
