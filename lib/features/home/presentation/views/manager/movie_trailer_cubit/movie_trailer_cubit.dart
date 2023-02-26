import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_land/features/home/data/models/movie/movie.trailer.dart';

import '../../../../data/repos/home_repo.dart';

part 'movie_trailer_state.dart';

class MovieTrailerCubit extends Cubit<MovieTrailerState> {
  MovieTrailerCubit(this.homeRepo) : super(MovieTrailerInitial());

  final HomeRepo homeRepo;

  Future<void> fetchMovieTrailer({required int movieId}) async {
    emit(MovieTrailerLoading());
    var result = await homeRepo.fetchMovieTrailer(movieId: movieId);

    result.fold(
        (failure) => {
              emit(MovieTrailerFailure(failure.errMessage)),
            },
        (movie) => {
              emit(MovieTrailerSuccess(movie)),
            });
  }
}
