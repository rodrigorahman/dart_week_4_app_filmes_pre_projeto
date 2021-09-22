import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:filmes_app/models/cast_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCast extends StatelessWidget {
  final CastModel cast;
  const MovieCast({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 95,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Visibility(
                visible: cast.image.isNotEmpty,
                child: FadeInImage.memoryNetwork(
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: 'https://image.tmdb.org/t/p/w200/${cast.image}',
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.network(
                        'https://static.thenounproject.com/png/2073332-200.png');
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              cast.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              cast.character,
              style: TextStyle(fontSize: 12, color: context.themeGrey),
            )
          ],
        ));
  }
}
