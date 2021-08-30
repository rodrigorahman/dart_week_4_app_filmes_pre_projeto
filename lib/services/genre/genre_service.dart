import 'package:filmes_app/models/genre_model.dart';

abstract class GenreService {
  Future<List<GenreModel>> getGenres();
}