/// A central repository for all API endpoint strings used in the application.
class ApiEndpoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'YOUR_API_KEY_HERE';
  
  /// Endpoint to discover movies.
  static String discoverMovies(int page) => '/discover/movie?api_key=$apiKey&page=$page';
  
  /// Endpoint to get movie details.
  static String movieDetail(int movieId) => '/movie/$movieId?api_key=$apiKey';
}
