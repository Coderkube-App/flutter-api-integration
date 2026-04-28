import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../providers/movie_provider.dart';

/// Implementation of the [MovieRepository] interface.
class MovieRepositoryImpl implements MovieRepository {
  final MovieProvider _movieProvider;

  MovieRepositoryImpl(this._movieProvider);

  @override
  Future<List<MovieEntity>> getMovies(int page) async {
    return await _movieProvider.getMovies(page);
  }

  @override
  Future<MovieDetailEntity> getMovieDetail(int movieId) async {
    return await _movieProvider.getMovieDetail(movieId);
  }
}
