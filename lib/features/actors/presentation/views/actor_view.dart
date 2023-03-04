import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/core/ulits/service_locator.dart';
import 'package:movies_land/core/widgets/custom_error_view.dart';
import 'package:movies_land/features/actors/presentation/manager/cubit/movie_by_actor_cubit.dart';
import 'package:movies_land/features/actors/presentation/views/widgets/actor_view_body.dart';
import 'package:movies_land/features/home/data/models/actor_model.dart';
import 'package:movies_land/features/home/data/repos/home_repo_impl.dart';

class ActorView extends StatefulWidget {
  const ActorView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final ActorModel movie;
  //final int movieId;
  @override
  State<ActorView> createState() => _ActorViewState();
}

class _ActorViewState extends State<ActorView> {
  @override
  void initState() {
    BlocProvider.of<MovieByActorCubit>(context)
        .fetchMovieByActor(movieId: widget.movie.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieByActorCubit, MovieByActorState>(
      builder: (context, state) {
        if (state is MovieByActorSuccess) {
          return ActorViewBody(
            actor: widget.movie,
            movies: state.movies,
          );
        } else if (state is MovieByActorFailure) {
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
