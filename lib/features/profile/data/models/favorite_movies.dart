import 'package:equatable/equatable.dart';

class FavoriteMoviesModel extends Equatable {
  final int? movie_ID;

  final String? movie_name;

  const FavoriteMoviesModel({
    this.movie_ID,
    this.movie_name,
  });

  factory FavoriteMoviesModel.fromJson(Map<String, dynamic> json) =>
      FavoriteMoviesModel(
        movie_ID: json['id'] as int?,
        movie_name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'movie_ID': movie_ID,
        'movie_name': movie_name,
      };

  @override
  List<Object?> get props {
    return [
      movie_ID,
      movie_name,
    ];
  }
}
