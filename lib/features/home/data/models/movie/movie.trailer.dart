import 'package:equatable/equatable.dart';

import 'result.trailer.dart';

class MovieTrailerModel extends Equatable {
  final int? id;
  final List<Result>? results;

  const MovieTrailerModel({this.id, this.results});

  factory MovieTrailerModel.fromJson(Map<String, dynamic> json) =>
      MovieTrailerModel(
        id: json['id'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'results': results?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, results];
}
