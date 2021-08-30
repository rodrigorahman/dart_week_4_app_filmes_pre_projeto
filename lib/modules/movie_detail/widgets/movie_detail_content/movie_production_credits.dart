import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieProductionCredits extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieProductionCredits({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: RichText(
          text: TextSpan(
            text: 'Companhia(s) produtora(s): ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
            children: [
              TextSpan(
                text: movie?.productionCompanies.join(', ') ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.normal, color: Color(0xFF222222)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
