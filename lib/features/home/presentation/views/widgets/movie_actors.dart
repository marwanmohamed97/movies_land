import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/features/home/data/models/actor_model.dart';
import 'package:movies_land/features/home/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import '../../../../../core/widgets/custom_error_view.dart';
import '../../manager/movie_actors_cubit/movie_actros_cubit.dart';

import 'movie_actors_view.dart';

class MovieActors extends StatelessWidget {
  const MovieActors({Key? key, d}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      // buildWhen: (previous, current) => current is MoviesDetailsSuccess,
      builder: (context, state) {
        if (state is MoviesDetailsSuccess) {
          return MovieActorsView(
            actor: state.movie,
          );
        } else if (state is MoviesDetailsFailure) {
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
