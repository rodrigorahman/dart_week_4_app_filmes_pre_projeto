import 'package:filmes_app/models/genre_model.dart';

abstract class GenreRepository {
  Future<List<GenreModel>> getGenres();
}