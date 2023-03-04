import 'package:either_dart/either.dart';
import 'package:movies_land/core/errors/failures.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/models/movie/movie.trailer.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import '../../../actors/data/models/movie_by_actor_model.dart';
import '../models/actor_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MoviesLandModel>>> fetchTrendingMovies();
  Future<Either<Failure, List<MoviesLandModel>>> fetchTopRatedMovies();
  Future<Either<Failure, List<MoviesLandModel>>> fetchNowPlayingMovies();
  Future<Either<Failure, List<MoviesLandModel>>> fetchSearchMovie(
      {required String movieName});
  Future<Either<Failure, List<MovieDetailModel>>> fetchMovieDetails(
      {required int movieId});
  Future<Either<Failure, List<MovieTrailerModel>>> fetchMovieTrailer(
      {required int movieId});
  Future<Either<Failure, List<MoviesLandModel>>> fetchRecommendedMovies(
      {required int movieId});
  Future<Either<Failure, List<ActorModel>>> fetchMovieActors(
      {required int movieId});
  Future<Either<Failure, List<MovieByActorModel>>> fetchMovieByActor(
      {required int movieId});
}
