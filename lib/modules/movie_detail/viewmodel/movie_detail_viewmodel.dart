import 'package:get/get.dart';
import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/repositories/movie_repository.dart';

/// ViewModel responsible for managing the state and logic of the Movie Detail screen.
class MovieDetailViewModel extends GetxController {
  final MovieRepository _movieRepository;

  MovieDetailViewModel(this._movieRepository);

  /// Observable for movie detail data.
  final movieDetail = Rxn<MovieDetailEntity>();
  
  /// Observable boolean indicating if a data fetch is in progress.
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final movieId = Get.arguments as int?;
    if (movieId != null) {
      fetchMovieDetail(movieId);
    }
  }

  /// Fetches movie details from the repository.
  Future<void> fetchMovieDetail(int movieId) async {
    try {
      isLoading.value = true;
      final detail = await _movieRepository.getMovieDetail(movieId);
      movieDetail.value = detail;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch movie details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
