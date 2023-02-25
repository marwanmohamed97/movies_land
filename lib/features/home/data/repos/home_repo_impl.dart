import 'package:dio/dio.dart';
import 'package:movies_land/core/ulits/api_service.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';
import 'package:movies_land/core/errors/failures.dart';
import 'package:either_dart/src/either.dart';
import 'package:movies_land/features/home/data/repos/home_repo.dart';

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
}
