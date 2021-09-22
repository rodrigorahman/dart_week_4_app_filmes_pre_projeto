import 'package:filmes_app/application/ui/filmes_app_icons.dart';
import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/modules/movie_detail/movie_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailHeader extends GetView<MovieDetailController> {
  final MovieDetailModel? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie!.urlImages.length,
          itemBuilder: (context, index) {
            final image = movie!.urlImages[index];
            if (image.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://image.tmdb.org/t/p/w500$image',
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
    } else {
      return const Center(
        child: Text('Erro ao buscar filme'),
      );
    }
  }
}
