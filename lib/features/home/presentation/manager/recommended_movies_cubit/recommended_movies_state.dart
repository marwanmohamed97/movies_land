part of 'recommended_movies_cubit.dart';

abstract class RecommendedMoviesState extends Equatable {
  const RecommendedMoviesState();

  @override
  List<Object> get props => [];
}

class RecommendedMoviesInitial extends RecommendedMoviesState {}

class RecommendedMoviesLoadnig extends RecommendedMoviesState {}

class RecommendedMoviesSuccess extends RecommendedMoviesState {
  final List<MoviesLandModel> movies;

  const RecommendedMoviesSuccess(this.movies);
}

class RecommendedMoviesfailure extends RecommendedMoviesState {
  final String errMessage;

  const RecommendedMoviesfailure(this.errMessage);
}
