import 'package:flutter/material.dart';

class OverviewBody extends StatelessWidget {
  final String overview;
  const OverviewBody({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Descripción:\n$overview',
          style: const TextStyle(
            fontSize: 17,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
