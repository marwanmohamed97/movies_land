import 'package:either_dart/either.dart';
import 'package:movies_land/core/errors/failures.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/models/movie/movie.trailer.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/features/home/presentation/views/manager/movie_trailer_cubit/movie_trailer_cubit.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MoviesLandModel>>> fetchTrendingMovies();
  Future<Either<Failure, List<MovieDetailModel>>> fetchMovieDetails(
      {required int movieId});
  Future<Either<Failure, List<MovieTrailerModel>>> fetchMovieTrailer(
      {required int movieId});
}
