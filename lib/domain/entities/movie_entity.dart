/// Entity representing a movie.
class MovieEntity {
  final int id;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final String posterPath;
  final String overview;

  MovieEntity({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.posterPath,
    required this.overview,
  });

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500$posterPath';
}
