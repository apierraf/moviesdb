import 'package:go_router/go_router.dart';
import 'package:moviesdb/presentation/details/screen/details_movie.dart';
import 'package:moviesdb/presentation/home/screen/home_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details',
          name: 'details',
          builder: (context, state) {
            int movieId = state.extra as int;
            return DetailsMovieScreen(movieId);
          },
        )
      ],
    ),
  ],
);
