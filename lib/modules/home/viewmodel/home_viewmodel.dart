import 'package:get/get.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/repositories/movie_repository.dart';

/// ViewModel responsible for managing the state and logic of the Home screen.
class HomeViewModel extends GetxController {
  final MovieRepository _movieRepository;

  HomeViewModel(this._movieRepository);

  /// Observable list of movies.
  final movies = <MovieEntity>[].obs;
  
  /// Observable boolean indicating if a data fetch is in progress.
  final isLoading = false.obs;

  /// Observable boolean indicating if more data is being loaded (pagination).
  final isMoreLoading = false.obs;

  /// Observable error message.
  final errorMessage = ''.obs;

  /// Current page for pagination.
  int currentPage = 1;

  /// Flag to track if more pages are available.
  bool canLoadMore = true;

  @override
  void onInit() {
    super.onInit();
    // Fetch initial movies when the controller is initialized.
    fetchMovies();
  }

  /// Fetches a list of movies from the repository.
  /// 
  /// [isLoadMore] specifies if this is a pagination request.
  Future<void> fetchMovies({bool isLoadMore = false}) async {
    if (isLoadMore) {
      if (isMoreLoading.value || !canLoadMore) return;
      isMoreLoading.value = true;
    } else {
      if (isLoading.value) return;
      isLoading.value = true;
      errorMessage.value = '';
      currentPage = 1;
      canLoadMore = true;
    }

    try {
      final movieList = await _movieRepository.getMovies(currentPage);
      
      if (isLoadMore) {
        movies.addAll(movieList);
      } else {
        movies.assignAll(movieList);
      }

      if (movieList.isEmpty) {
        canLoadMore = false;
      } else {
        currentPage++;
      }
    } catch (e) {
      if (!isLoadMore) {
        errorMessage.value = 'Failed to fetch movies: $e';
      }
      Get.snackbar('Error', 'Failed to fetch movies: $e');
    } finally {
      isLoading.value = false;
      isMoreLoading.value = false;
    }
  }

  /// Loads the next page of movies.
  Future<void> loadMore() async {
    await fetchMovies(isLoadMore: true);
  }
}
