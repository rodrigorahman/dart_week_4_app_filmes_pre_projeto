import 'package:filmes_app/application/ui/widgets/movies_filters/movies_filters.dart';
import 'package:filmes_app/modules/movies/movies_controller.dart';
import 'package:filmes_app/modules/movies/widget/movies_group/movies_group.dart';
import 'package:filmes_app/modules/movies/widget/movies_header.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          const MoviesHeader(),
          const MoviesFilters(),
          MoviesGroup(
            title: 'Mais Populares',
            movies: controller.popularMovies,
          ),
          MoviesGroup(
            title: 'Top Filmes',
            movies: controller.topMovies,
          ),
        ],
      ),
    );
  }
}
