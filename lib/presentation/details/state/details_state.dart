import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesdb/data/services/movies_impl.dart';
import 'package:moviesdb/domain/models/details_movie.dart';

final detailsStateProvider =
    FutureProvider.family<MoviesDetails, int>((ref, int idMovie) async {
  final moviesRepository = PopularMoviesImpl();
  return await moviesRepository.getMovie(idMovie);
});
