import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesdb/core/env/environment_config.dart';

class DetailsBar extends StatelessWidget {
  final String image;
  final String title;
  const DetailsBar({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      final scrolled = constraints.scrollOffset > 150;
      return SliverAppBar(
        pinned: true,
        floating: true,
        snap: false,
        expandedHeight: 300.0,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 45,
            color: scrolled ? Colors.black54 : Colors.white,
          ),
        ),
        title: scrolled ? Text(title) : null,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: CachedNetworkImage(
            imageUrl: '${EnvironmentoConfig.imageUrl}/$image',
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) => Card(
              child: Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
