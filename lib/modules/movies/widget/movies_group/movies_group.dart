import 'package:filmes_app/application/ui/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesGroup extends StatelessWidget {
  final String title;

  const MoviesGroup({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold,),
                ),
              ),
              const Text(
                'Ver todos',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return MovieCard(
                favorite: index % 2 == 0,
                urlImage: 
                index % 2 == 0 ? 
                'https://upload.wikimedia.org/wikipedia/en/4/4e/Captain_Marvel_%28film%29_poster.jpg' : 
                'https://br.web.img3.acsta.net/pictures/19/04/03/18/23/2539612.jpg'
                ,
              );
            },
          ),
        )
      ],
    );
  }
}
