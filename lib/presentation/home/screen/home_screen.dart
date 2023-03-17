import 'package:flutter/material.dart';
import 'package:moviesdb/presentation/home/widgets/list_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('Películas Populares'),
          ),
          const ListMovies(),
        ],
      ),
    );
  }
}
