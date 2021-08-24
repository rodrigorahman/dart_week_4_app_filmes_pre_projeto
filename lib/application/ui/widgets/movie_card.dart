import 'package:filmes_app/application/ui/filmes_app_icons.dart';
import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MovieCard extends StatelessWidget {
  final bool favorite;
  final String urlImage;
  const MovieCard({
    Key? key,
    this.favorite = false,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/movie/detail');
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 148,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 148,
                  height: 184,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(urlImage),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Coringa',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                const Text(
                  '2019',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ],
            ),
            Positioned(
              bottom: 25,
              right: -3,
              child: SizedBox(
                height: 40,
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
            )
          ],
        ),
      ),
    );
  }
}
