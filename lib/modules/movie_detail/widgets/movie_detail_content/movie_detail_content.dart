import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_content/movie_production_credits.dart';
import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_content/movie_title.dart';
import 'package:flutter/material.dart';

import 'movie_content.dart';
import 'movie_main_cast.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        MovieTitle(),
        MovieContent(),
        MovieProductionCredits(),
        MovieMainCast(),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
