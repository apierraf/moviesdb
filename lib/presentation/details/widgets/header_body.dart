import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moviesdb/core/env/environment_config.dart';
import 'package:moviesdb/domain/models/details_movie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HeaderBody extends ConsumerWidget {
  final String image;
  final String title;
  final DateTime date;
  final String lenguage;
  final List<Genre> genre;
  final double popularity;
  final double average;

  const HeaderBody(
    this.image,
    this.title,
    this.date,
    this.lenguage,
    this.genre,
    this.popularity,
    this.average, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl: '${EnvironmentoConfig.imageUrl}/$image',
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 150,
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Card(
                child: Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
              ),
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Título: $title',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Fecha: ${DateFormat.yMMMMd().format(date)}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Idioma: ${lenguage.toUpperCase()}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.thumb_up,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  popularity.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: 20,
                          footer: Text(
                            average.toString(),
                          ),
                          animation: true,
                          percent: average / 10,
                          circularStrokeCap: CircularStrokeCap.round,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: genre.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Chip(
                            label: Text(genre[index].name),
                            elevation: 4,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
