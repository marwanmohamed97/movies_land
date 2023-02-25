import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/features/home/data/repos/home_repo.dart';

part 'movies_land_state.dart';

class MoviesLandCubit extends Cubit<MoviesLandState> {
  MoviesLandCubit(this.homeRepo) : super(MoviesLandInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTrendingMovies() async {
    emit(MoviesLandLoading());
    var result = await homeRepo.fetchTrendingMovies();

    result.fold(
        (failure) => {
              emit(MoviesLandfailure(failure.errMessage)),
            },
        (moviesLandModel) => {
              emit(MoviesLandSuccess(moviesLandModel)),
            });
  }
}
