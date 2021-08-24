import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({Key? key}) : super(key: key);

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
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/en/4/4e/Captain_Marvel_%28film%29_poster.jpg',
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Giacomo Gianniotti',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              'Giacomo',
              style: TextStyle(fontSize: 12, color: context.themeGrey),
            )
          ],
        ));
  }
}
