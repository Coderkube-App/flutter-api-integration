import '../../core/network/api_endpoints.dart';
import '../../core/network/http_helper.dart';
import '../models/movie_model.dart';
import '../models/movie_detail_model.dart';

/// Provider class for fetching movie data from the API.
class MovieProvider {
  final HttpHelper _httpHelper;

  MovieProvider(this._httpHelper);

  /// Fetches a list of movies for a given [page].
  Future<List<MovieModel>> getMovies(int page) async {
    try {
      final response = await _httpHelper.get(ApiEndpoints.discoverMovies(page));
      final List results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches details for a specific movie by [movieId].
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    try {
      final response = await _httpHelper.get(ApiEndpoints.movieDetail(movieId));
      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
