import 'package:get/get.dart';
import '../../../core/network/http_helper.dart';
import '../../../data/providers/movie_provider.dart';
import '../../../data/repositories/movie_repository_impl.dart';
import '../../../domain/repositories/movie_repository.dart';
import '../viewmodel/home_viewmodel.dart';

/// Dependency injection binding for the Home module.
/// 
/// Sets up the necessary [HttpHelper], [PostRepository], and [HomeViewModel]
/// dependencies for the Home screen.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    /// Injects [HttpHelper] to handle network requests.
    Get.lazyPut<HttpHelper>(() => HttpHelper());
    
    /// Injects [MovieProvider] to fetch data from the API.
    Get.lazyPut<MovieProvider>(() => MovieProvider(Get.find<HttpHelper>()));
    
    /// Injects the concrete implementation of [MovieRepository].
    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl(Get.find<MovieProvider>()));
    
    /// Injects [HomeViewModel] and provides it with the [MovieRepository] instance.
    Get.lazyPut<HomeViewModel>(() => HomeViewModel(Get.find<MovieRepository>()));
  }
}
