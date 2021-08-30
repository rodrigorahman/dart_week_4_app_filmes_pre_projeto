import 'package:filmes_app/application/ui/filmes_app_icons.dart';
import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailHeader extends StatelessWidget {

  final bool favorite = false;
  final MovieDetailModel? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 296,
      child: Stack(
        children: [
          SizedBox(
            height: 278,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie?.urlImages.length ?? 0,
              itemBuilder: (context, index) {
                final image = movie?.urlImages[index];
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500$image'),
                );
              },
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: SizedBox(
              height: 35,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: IconButton(
                  iconSize: 15,
                  onPressed: () {},
                  icon: Icon(
                    favorite
                        ? FilmesAppIcons.heart
                        : FilmesAppIcons.heart_empty,
                    color: favorite ? context.themeRed : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
