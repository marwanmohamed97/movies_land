import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo.dart';

part 'rated_movies_state.dart';

class RatedMoviesCubit extends Cubit<RatedMoviesState> {
  RatedMoviesCubit(this.homeRepo) : super(RatedMoviesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchRatedMovies(
      {required String ratedMovies, required int movieID}) async {
    var result = await homeRepo.fetchRatedMovies(
        ratedMovies: ratedMovies, movieID: movieID);

    result.fold(
        (failure) => {
              emit(RatedMoviesFaliure(failure.errMessage)),
            },
        (rate) => {
              emit(RatedMoviesSuccess(rate)),
            });
  }
}
