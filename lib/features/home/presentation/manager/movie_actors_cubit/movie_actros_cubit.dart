import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/actor_model.dart';
import '../../../data/repos/home_repo.dart';

part 'movie_actros_state.dart';

class MovieActrosCubit extends Cubit<MovieActrosState> {
  MovieActrosCubit(this.homeRepo) : super(MovieActrosInitial());

  final HomeRepo homeRepo;

  Future<void> fetchMovieActors({required int movieId}) async {
    emit(MovieActrosLoading());
    var result = await homeRepo.fetchMovieActors(movieId: movieId);

    result.fold(
        (failure) => {
              emit(MovieActrosfailure(failure.errMessage)),
            },
        (movie) => {
              emit(MovieActrosSuccess(movie)),
            });
  }
}
