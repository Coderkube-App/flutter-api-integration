import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/movie_detail_viewmodel.dart';
import '../../../core/widgets/app_loader.dart';

/// The Movie Detail screen.
class MovieDetailView extends GetView<MovieDetailViewModel> {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton.icon(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          label: const Text('Back', style: TextStyle(fontSize: 16)),
        ),
        title: Obx(() => Text(
              controller.movieDetail.value?.title ?? 'Loading...',
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoader();
        }

        final movie = controller.movieDetail.value;
        if (movie == null) {
          return const Center(child: Text('Movie details not found'));
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Backdrop Image
              CachedNetworkImage(
                imageUrl: movie.fullBackdropPath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 250,
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 250,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 16),
              // Poster and Info Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: movie.fullPosterPath,
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 100,
                          height: 150,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.thumb_up, color: Colors.amber, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                movie.voteAverage.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            movie.releaseDate,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Details Sections
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailSection('Genres', movie.genres.join(', ')),
                    const SizedBox(height: 16),
                    _buildDetailSection('Languages', movie.languages.join(', ')),
                    const SizedBox(height: 16),
                    _buildDetailSection('Production Companies', movie.productionCompanies.join(', ')),
                    const SizedBox(height: 24),
                    Text(
                      movie.overview,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDetailSection(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(
            text: '$label :',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
