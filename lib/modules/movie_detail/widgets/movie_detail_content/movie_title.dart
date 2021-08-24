import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Luca',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RatingStars(
            value: 5,
            valueLabelVisibility: false,
            starColor: context.themeOrange,
            starSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Animação, Comédia, Família, Fantasia',
            style: TextStyle(fontSize: 11, color: context.themeGrey),
          )
        ],
      ),
    );
  }
}
