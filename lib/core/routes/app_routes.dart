import 'package:go_router/go_router.dart';
import 'package:moviesdb/presentation/home/presentation/home_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
