import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../home/data/repos/home_repo.dart';
import '../../../data/models/movie_by_actor_model.dart';

part 'movie_by_actor_state.dart';

class MovieByActorCubit extends Cubit<MovieByActorState> {
  MovieByActorCubit(this.homeRepo) : super(MovieByActorInitial());

  final HomeRepo homeRepo;

  Future<void> fetchMovieByActor({required int movieId}) async {
    emit(MovieByActorLoading());
    var result = await homeRepo.fetchMovieByActor(movieId: movieId);

    result.fold(
        (failure) => {
              emit(MovieByActorFailure(failure.errMessage)),
            },
        (movie) => {
              emit(MovieByActorSuccess(movie)),
            });
  }
}
