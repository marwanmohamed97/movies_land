part of 'movies_land_cubit.dart';

abstract class MoviesLandState extends Equatable {
  const MoviesLandState();

  @override
  List<Object> get props => [];
}

class MoviesLandInitial extends MoviesLandState {}

class MoviesLandLoading extends MoviesLandState {}

class MoviesLandSuccess extends MoviesLandState {
  final List<MoviesLandModel> movies;

  const MoviesLandSuccess(this.movies);
}

class MoviesLandfailure extends MoviesLandState {
  final String errMessage;

  const MoviesLandfailure(this.errMessage);
}
