import 'package:filmes_app/models/genre_model.dart';
import 'package:filmes_app/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'filter_tag.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() {
          return Row(
            children: controller.genres
                .map(
                  (e) => FilterTag(
                    model: e,
                    selected: e.id == (controller.genreSelected.value?.id ?? 0),
                    onPressed: () => controller.filterMoviesByGenre(e),
                  ),
                )
                .toList(),
            // children: [
            //   FilterTag(),
            //   FilterTag(
            //     selected: true,
            //   ),
            //   FilterTag(),
            //   FilterTag(),
            //   FilterTag(),
            // ],
          );
        }),
      ),
    );
  }
}
