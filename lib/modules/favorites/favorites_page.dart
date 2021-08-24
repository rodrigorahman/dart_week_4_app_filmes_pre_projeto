import 'package:filmes_app/application/ui/widgets/movie_card.dart';
import 'package:filmes_app/application/ui/widgets/movies_filters/movies_filters.dart';
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
      body: ListView(
        children: [
          const MoviesFilters(),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: List.generate(10, (index) => index)
                .map((e) => const MovieCard(
                      urlImage:
                          'https://upload.wikimedia.org/wikipedia/en/4/4e/Captain_Marvel_%28film%29_poster.jpg',
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
