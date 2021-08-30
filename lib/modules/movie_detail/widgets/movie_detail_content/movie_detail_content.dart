import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_content/movie_production_credits.dart';
import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_content/movie_title.dart';
import 'package:flutter/material.dart';

import 'movie_content.dart';
import 'movie_main_cast.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTitle(movie: movie),
        MovieContent(movie: movie),
        MovieProductionCredits(movie: movie),
        MovieMainCast(movie: movie),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
