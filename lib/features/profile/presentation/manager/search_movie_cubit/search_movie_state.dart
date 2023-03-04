part of 'search_movie_cubit.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieSuccess extends SearchMovieState {
  final List<MoviesLandModel> movies;

  const SearchMovieSuccess(this.movies);
}

class SearchMovieFailure extends SearchMovieState {
  final String errMessage;

  const SearchMovieFailure(this.errMessage);
}
