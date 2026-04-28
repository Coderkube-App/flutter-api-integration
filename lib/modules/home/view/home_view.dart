import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../viewmodel/home_viewmodel.dart';
import '../../../core/widgets/app_loader.dart';

/// The Home screen of the application.
class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Movie List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.movies.isEmpty) {
          return const AppLoader();
        }

        if (controller.errorMessage.isNotEmpty && controller.movies.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: controller.fetchMovies,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (controller.movies.isEmpty) {
          return const Center(child: Text('No movies found'));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              controller.loadMore();
            }
            return true;
          },
          child: RefreshIndicator(
             onRefresh: () async {
               controller.fetchMovies();
             },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: controller.movies.length + (controller.isMoreLoading.value ? 1 : 0),
              separatorBuilder: (context, index) => const Divider(height: 32),
              itemBuilder: (context, index) {
                if (index == controller.movies.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final movie = controller.movies[index];
                return GestureDetector(
                  onTap: () => Get.toNamed(Routes.MOVIE_DETAIL, arguments: movie.id),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl: movie.fullPosterPath,
                              width: 80,
                              height: 100,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey[200],
                                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                              ),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  movie.releaseDate,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.thumb_up, color: Colors.amber, size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      movie.voteAverage.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        movie.overview,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
