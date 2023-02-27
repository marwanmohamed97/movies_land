part of 'movie_actros_cubit.dart';

abstract class MovieActrosState extends Equatable {
  const MovieActrosState();

  @override
  List<Object> get props => [];
}

class MovieActrosInitial extends MovieActrosState {}

class MovieActrosLoading extends MovieActrosState {}

class MovieActrosSuccess extends MovieActrosState {
  final List<ActorModel> actor;

  const MovieActrosSuccess(this.actor);
}

class MovieActrosfailure extends MovieActrosState {
  final String errMessage;

  const MovieActrosfailure(this.errMessage);
}
