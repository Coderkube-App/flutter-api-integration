import 'package:get/get.dart';
import '../../../core/network/http_helper.dart';
import '../../../data/providers/movie_provider.dart';
import '../../../data/repositories/movie_repository_impl.dart';
import '../../../domain/repositories/movie_repository.dart';
import '../viewmodel/movie_detail_viewmodel.dart';

/// Dependency injection binding for the Movie Detail module.
class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpHelper>(() => HttpHelper());
    Get.lazyPut<MovieProvider>(() => MovieProvider(Get.find<HttpHelper>()));
    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl(Get.find<MovieProvider>()));
    Get.lazyPut<MovieDetailViewModel>(() => MovieDetailViewModel(Get.find<MovieRepository>()));
  }
}
