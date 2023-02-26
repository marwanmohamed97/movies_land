part of 'movies_details_cubit.dart';

abstract class MoviesDetailsState extends Equatable {
  const MoviesDetailsState();

  @override
  List<Object> get props => [];
}

class MoviesDetailsInitial extends MoviesDetailsState {}

class MoviesDetailsLoading extends MoviesDetailsState {}

class MoviesDetailsSuccess extends MoviesDetailsState {
  final List<MovieDetailModel> movie;

  const MoviesDetailsSuccess(this.movie);
}

class MoviesDetailsFailure extends MoviesDetailsState {
  final String errMessage;

  const MoviesDetailsFailure(this.errMessage);
}
