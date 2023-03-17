import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviesLoading extends StatelessWidget {
  const MoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade300,
        child: Card(
          child: Container(
            height: 350,
          ),
        ),
      ),
    );
  }
}
