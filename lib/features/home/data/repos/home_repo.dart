import 'package:either_dart/either.dart';
import 'package:movies_land/core/errors/failures.dart';
import 'package:movies_land/features/home/data/models/movies_land_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, MoviesLandModel>> fetchTrendingMovies();
}
