import '../../domain/entities/movie_entity.dart';

/// Data model for a movie, extending [MovieEntity].
class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.posterPath,
    required super.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0.0).toDouble(),
      posterPath: json['poster_path'] ?? '',
      overview: json['overview'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'poster_path': posterPath,
      'overview': overview,
    };
  }
}
