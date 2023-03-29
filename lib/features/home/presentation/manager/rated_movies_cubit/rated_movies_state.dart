part of 'rated_movies_cubit.dart';

abstract class RatedMoviesState extends Equatable {
  const RatedMoviesState();

  @override
  List<Object> get props => [];
}

class RatedMoviesInitial extends RatedMoviesState {}

class RatedMoviesSuccess extends RatedMoviesState {
  final double movieRate;

  const RatedMoviesSuccess(this.movieRate);
}

class RatedMoviesFaliure extends RatedMoviesState {
  final String errMessage;

  const RatedMoviesFaliure(this.errMessage);
}
