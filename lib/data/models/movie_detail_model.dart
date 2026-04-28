import '../../domain/entities/movie_detail_entity.dart';

/// Data model for movie details, extending [MovieDetailEntity].
class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.genres,
    required super.languages,
    required super.productionCompanies,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0.0).toDouble(),
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? '',
      genres: (json['genres'] as List?)?.map((e) => e['name'] as String).toList() ?? [],
      languages: (json['spoken_languages'] as List?)?.map((e) => e['english_name'] as String).toList() ?? [],
      productionCompanies: (json['production_companies'] as List?)?.map((e) => e['name'] as String).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
      'genres': genres,
      'spoken_languages': languages,
      'production_companies': productionCompanies,
    };
  }
}
