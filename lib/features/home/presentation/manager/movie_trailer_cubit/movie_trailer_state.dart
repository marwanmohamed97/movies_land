part of 'movie_trailer_cubit.dart';

abstract class MovieTrailerState extends Equatable {
  const MovieTrailerState();

  @override
  List<Object> get props => [];
}

class MovieTrailerInitial extends MovieTrailerState {}

class MovieTrailerLoading extends MovieTrailerState {}

class MovieTrailerSuccess extends MovieTrailerState {
  final List<MovieTrailerModel> movie;

  const MovieTrailerSuccess(this.movie);
}

class MovieTrailerFailure extends MovieTrailerState {
  final String errMessage;

  const MovieTrailerFailure(this.errMessage);
}
