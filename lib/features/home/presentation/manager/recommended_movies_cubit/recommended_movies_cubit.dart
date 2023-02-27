import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import '../../../data/repos/home_repo.dart';
part 'recommended_movies_state.dart';

class RecommendedMoviesCubit extends Cubit<RecommendedMoviesState> {
  RecommendedMoviesCubit(this.homeRepo) : super(RecommendedMoviesInitial());

  final HomeRepo homeRepo;
  Future<void> fetchRecommendedMovies({required int movieId}) async {
    emit(RecommendedMoviesLoadnig());
    var result = await homeRepo.fetchRecommendedMovies(movieId: movieId);

    result.fold(
        (failure) => {
              emit(RecommendedMoviesfailure(failure.errMessage)),
              print('failure')
            },
        (moviesLandModel) => {
              emit(RecommendedMoviesSuccess(moviesLandModel)),
              print('success')
            });
  }
}
