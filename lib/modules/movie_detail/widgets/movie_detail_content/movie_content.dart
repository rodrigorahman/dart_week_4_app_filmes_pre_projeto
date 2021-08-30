import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:flutter/material.dart';
    
class MovieContent extends StatelessWidget {
  
  final MovieDetailModel? movie;
  const MovieContent({ Key? key , required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 50),
            child: Text(
              movie?.overview ?? '',
              style: const TextStyle(
                fontSize: 14,
                // heigth é a separação da linha
                height: 1.3,
              ),
            ),
          )
        ],
      ),
    );
  }
}