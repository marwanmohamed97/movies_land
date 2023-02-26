import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';

import '../../../../data/repos/home_repo.dart';

part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(this.homeRepo) : super(MoviesDetailsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchMovieDetails({required int movieId}) async {
    emit(MoviesDetailsLoading());
    var result = await homeRepo.fetchMovieDetails(movieId: movieId);

    result.fold(
        (failure) => {
              emit(MoviesDetailsFailure(failure.errMessage)),
            },
        (movie) => {
              emit(MoviesDetailsSuccess(movie)),
            });
  }
}
