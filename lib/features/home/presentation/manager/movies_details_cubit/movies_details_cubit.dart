import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/features/home/data/models/actor_model.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import '../../../data/repos/home_repo.dart';
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

  Future<void> fetchRatedMovies(
      {required String ratedMovies, required int movieID}) async {
    emit(MoviesDetailsLoading());
    var result = await homeRepo.fetchAllRatedMovies(ratedMovies: ratedMovies);

    result.fold(
        (failure) => {
              emit(MoviesDetailsFailure(failure.errMessage)),
            },
        (movie) => {
              emit(MoviesDetailsSuccess(movie as List)),
            });
  }

  Future<void> fetchMovieActors({required int movieId}) async {
    emit(MoviesDetailsLoading());
    var result = await homeRepo.fetchMovieActors(movieId: movieId);

    result.fold(
        (failure) => {
              emit(MoviesDetailsFailure(failure.errMessage)),
            },
        (movie) => {
              emit(MoviesDetailsSuccess(movie)),
            });
  }

  Future<void> fetchRecommendedMovies({required int movieId}) async {
    emit(MoviesDetailsLoading());
    var result = await homeRepo.fetchRecommendedMovies(movieId: movieId);

    result.fold(
        (failure) => {
              emit(MoviesDetailsFailure(failure.errMessage)),
            },
        (moviesLandModel) => {
              emit(MoviesDetailsSuccess(moviesLandModel)),
            });
  }
}
