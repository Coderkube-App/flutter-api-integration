/// Entity representing movie details.
class MovieDetailEntity {
  final int id;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final List<String> genres;
  final List<String> languages;
  final List<String> productionCompanies;

  MovieDetailEntity({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.genres,
    required this.languages,
    required this.productionCompanies,
  });

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get fullBackdropPath => 'https://image.tmdb.org/t/p/original$backdropPath';
}
