import 'package:flutter/material.dart';
import 'package:moviesdb/core/env/environment_config.dart';
import 'package:moviesdb/data/repository/movies_repository.dart';
import 'package:moviesdb/domain/models/popular_movie.dart';

import 'package:http/http.dart' as http;

class PopularMoviesImpl extends PopularMoviesRepository {
  @override
  Future<PopularMovies> getPopularMovies(int page) async {
    late PopularMovies popularMovies;

    //request to get popular movies from movieDB
    var request = http.Request(
      'GET',
      Uri.parse(
          '${EnvironmentoConfig.base_url}/popular?api_key=${EnvironmentoConfig.api_key}&page=$page'),
    );

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      popularMovies = popularMoviesFromJson(
        await response.stream.bytesToString(),
      );
    } else {
      debugPrint('movie error: ${response.reasonPhrase}');
    }

    return popularMovies;
  }
}
