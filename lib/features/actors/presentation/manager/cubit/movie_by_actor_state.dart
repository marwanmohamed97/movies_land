part of 'movie_by_actor_cubit.dart';

abstract class MovieByActorState extends Equatable {
  const MovieByActorState();

  @override
  List<Object> get props => [];
}

class MovieByActorInitial extends MovieByActorState {}

class MovieByActorLoading extends MovieByActorState {}

class MovieByActorSuccess extends MovieByActorState {
  final List<MovieByActorModel> movies;

  const MovieByActorSuccess(this.movies);
}

class MovieByActorFailure extends MovieByActorState {
  final String errMessage;

  const MovieByActorFailure(this.errMessage);
}
