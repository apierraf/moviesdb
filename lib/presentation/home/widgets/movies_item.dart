import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesdb/core/env/environment_config.dart';
import 'package:moviesdb/domain/models/popular_movie.dart';
import 'package:moviesdb/presentation/home/state/home_state.dart';
import 'package:moviesdb/presentation/home/widgets/movies_loading.dart';

class MoviesItems extends ConsumerWidget {
  const MoviesItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Movies> moviesAsync =
        ref.watch(currentPopularMoviesProvider);
    return moviesAsync.when(
      data: (data) {
        return InkWell(
          onTap: () => context.goNamed(
            'details',
            extra: data.id,
          ),
          child: CachedNetworkImage(
            imageUrl: '${EnvironmentoConfig.imageUrl}/${data.posterPath}',
            imageBuilder: (context, imageProvider) {
              return Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            progressIndicatorBuilder: (context, url, downloadProgress) => Card(
              child: Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
            ),
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
      error: (error, stackTrace) => const Icon(Icons.error),
      loading: () => const MoviesLoading(),
    );
  }
}
