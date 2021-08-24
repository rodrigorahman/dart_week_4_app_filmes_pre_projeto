import 'package:filmes_app/application/ui/filmes_app_icons.dart';
import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class MovieDetailHeader extends StatelessWidget {

  final bool favorite = false;

  const MovieDetailHeader({Key? key}) : super(key: key);

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
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/en/4/4e/Captain_Marvel_%28film%29_poster.jpg'),
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
