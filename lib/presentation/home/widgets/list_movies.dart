import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesdb/domain/models/popular_movie.dart';
import 'package:moviesdb/presentation/home/state/home_state.dart';
import 'package:moviesdb/presentation/home/widgets/movies_item.dart';

class ListMovies extends ConsumerWidget {
  const ListMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMoviesCount = ref.watch(popularMoviesCountProvider);
    return popularMoviesCount.when(
      data: (data) {
        return SliverGrid.builder(
          itemCount: data,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 350,
          ),
          itemBuilder: (context, index) {
            final AsyncValue<Movies> currentPopularMoviesFromIndex =
                ref.watch(paginatedPopularMoviesProvider(index ~/ 20)).whenData(
                      (PopularMovies pageData) => pageData.results[index % 20],
                    );

            return ProviderScope(
              overrides: [
                currentPopularMoviesProvider
                    .overrideWithValue(currentPopularMoviesFromIndex)
              ],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: MoviesItems(),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) =>
          const SliverToBoxAdapter(child: Icon(Icons.error)),
      loading: () => const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
