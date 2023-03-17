import 'dart:convert';

PopularMovies popularMoviesFromJson(String str) =>
    PopularMovies.fromJson(json.decode(str));

String popularMoviesToJson(PopularMovies data) => json.encode(data.toJson());

class PopularMovies {
  PopularMovies({
    this.page = 1,
    this.results = const [],
    this.totalPages = 1,
    this.totalResults = 1,
  });

  final int page;
  final List<Movies> results;
  final int totalPages;
  final int totalResults;

  factory PopularMovies.fromJson(Map<String, dynamic> json) => PopularMovies(
        page: json["page"],
        results:
            List<Movies>.from(json["results"].map((x) => Movies.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Movies {
  Movies({
    required this.backdropPath,
    required this.id,
    required this.posterPath,
    required this.voteAverage,
  });

  final String backdropPath;
  final int id;
  final String posterPath;
  final double voteAverage;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "poster_path": posterPath,
        "vote_average": voteAverage,
      };
}
