import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';

import '../../../../home/data/repos/home_repo.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit(this.homeRepo) : super(SearchMovieInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchMovie({required String movieName}) async {
    emit(SearchMovieLoading());
    var result = await homeRepo.fetchSearchMovie(movieName: movieName);

    result.fold(
        (failure) => {
              emit(SearchMovieFailure(failure.errMessage)),
            },
        (movie) => {
              emit(SearchMovieSuccess(movie)),
            });
  }
}
