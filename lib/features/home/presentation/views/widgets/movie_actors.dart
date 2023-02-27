import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_view.dart';
import '../../manager/movie_actors_cubit/movie_actros_cubit.dart';

import 'movie_actors_view.dart';

class MovieActors extends StatelessWidget {
  const MovieActors({Key? key, required this.movieId}) : super(key: key);

  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieActrosCubit, MovieActrosState>(
      builder: (context, state) {
        if (state is MovieActrosSuccess) {
          return MovieActorsView(
            actor: state.actor,
          );
        } else if (state is MovieActrosfailure) {
          return CustomErrorView(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
