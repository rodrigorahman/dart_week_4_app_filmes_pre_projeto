import 'package:filmes_app/application/ui/widgets/movie_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Meus favoritos'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (e) => MovieCard(
                      movieModel: e,
                      favoriteCallback: () => controller.removeFavorite(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
