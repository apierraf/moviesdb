import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:moviesdb/presentation/details/state/details_state.dart';
import 'package:moviesdb/presentation/details/widgets/details_bar.dart';
import 'package:moviesdb/presentation/details/widgets/header_body.dart';
import 'package:moviesdb/presentation/details/widgets/overview_body.dart';

class DetailsMovieScreen extends ConsumerWidget {
  final int movieId;
  const DetailsMovieScreen(
    this.movieId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(
      detailsStateProvider(movieId),
    );
    return Scaffold(
      body: details.when(
        data: (data) {
          return CustomScrollView(
            slivers: [
              DetailsBar(
                image: data.backdropPath,
                title: data.originalTitle,
              ),
              HeaderBody(
                data.posterPath,
                data.title,
                data.releaseDate,
                data.originalLanguage,
                data.genres,
                data.popularity,
                data.voteAverage,
              ),
              OverviewBody(
                overview: data.overview,
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Icon(Icons.error),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
