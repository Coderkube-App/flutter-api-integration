import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/movie_detail/bindings/movie_detail_binding.dart';
import '../modules/movie_detail/view/movie_detail_view.dart';

part 'app_routes.dart';

/// A central repository for defining all application pages and their respective bindings.
class AppPages {
  /// The initial route displayed when the app starts.
  static const INITIAL = Routes.HOME;

  /// The list of all available [GetPage] configurations.
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      // TODO: Add transition animations for better UX.
    ),
    GetPage(
      name: Routes.MOVIE_DETAIL,
      page: () => const MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
  ];
}
