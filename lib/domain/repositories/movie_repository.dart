import '../entities/movie_entity.dart';
import '../entities/movie_detail_entity.dart';

/// Abstract repository defining movie-related operations.
abstract class MovieRepository {
  /// Fetches a list of movies for a given [page].
  Future<List<MovieEntity>> getMovies(int page);

  /// Fetches details for a specific movie by [movieId].
  Future<MovieDetailEntity> getMovieDetail(int movieId);
}
