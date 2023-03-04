import 'package:dio/dio.dart';
import 'package:movies_land/core/ulits/api_service.dart';
import 'package:movies_land/features/home/data/models/movie/movie.details.dart';
import 'package:movies_land/features/home/data/models/movie/movie.trailer.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/core/errors/failures.dart';
import 'package:either_dart/src/either.dart';
import 'package:movies_land/features/home/data/repos/home_repo.dart';
import '../../../actors/data/models/movie_by_actor_model.dart';
import '../models/actor_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;
  final String apiKey = '319b1920e86cdd05a805f90bbf1e21b7';
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MoviesLandModel>>> fetchTrendingMovies() async {
    try {
      var data = await apiService.get(
        endPoint: 'trending/movie/day?api_key=$apiKey',
      );
      List<MoviesLandModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesLandModel.fromJson(item));
      }
      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesLandModel>>> fetchTopRatedMovies() async {
    try {
      var data = await apiService.get(
        endPoint: 'movie/top_rated?api_key=$apiKey',
      );
      List<MoviesLandModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesLandModel.fromJson(item));
      }
      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesLandModel>>> fetchNowPlayingMovies() async {
    try {
      var data = await apiService.get(
        endPoint: 'movie/now_playing?api_key=$apiKey',
      );
      List<MoviesLandModel> movies = [];
      for (var item in data['results']) {
        movies.add(MoviesLandModel.fromJson(item));
      }
      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailModel>>> fetchMovieDetails(
      {required int movieId}) async {
    try {
      var data = await apiService.get(
        endPoint: 'movie/$movieId?api_key=$apiKey',
      );
      List<MovieDetailModel> movies = [];

      movies.add(MovieDetailModel.fromJson(data));

      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieTrailerModel>>> fetchMovieTrailer(
      {required int movieId}) async {
    try {
      var data = await apiService.get(
        endPoint: 'movie/$movieId/videos?api_key=$apiKey',
      );
      List<MovieTrailerModel> movies = [];

      movies.add(MovieTrailerModel.fromJson(data));

      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesLandModel>>> fetchRecommendedMovies(
      {required int movieId}) async {
    try {
      var data = await apiService.get(
        endPoint: 'movie/$movieId/similar?api_key=$apiKey',
      );
      List<MoviesLandModel> movies = [];

      for (var item in data['results']) {
        movies.add(MoviesLandModel.fromJson(item));
      }

      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ActorModel>>> fetchMovieActors(
      {required int movieId}) async {
    try {
      var data = await apiService.get(
        endPoint: 'movie/$movieId/credits?api_key=$apiKey',
      );
      List<ActorModel> movies = [];

      for (var item in data['cast']) {
        movies.add(ActorModel.fromJson(item));
      }

      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieByActorModel>>> fetchMovieByActor(
      {required int movieId}) async {
    try {
      var data = await apiService.get(
        endPoint:
            'person/$movieId/movie_credits?api_key=$apiKey&language=en-US',
      );
      List<MovieByActorModel> movies = [];

      for (var item in data['cast']) {
        movies.add(MovieByActorModel.fromJson(item));
      }

      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesLandModel>>> fetchSearchMovie(
      {required String movieName}) async {
    try {
      var data = await apiService.get(
        endPoint:
            'search/movie?api_key=$apiKey&language=en-US&page=1&include_adult=false&query=$movieName',
      );
      List<MoviesLandModel> movies = [];

      for (var item in data['results']) {
        movies.add(MoviesLandModel.fromJson(item));
      }

      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
