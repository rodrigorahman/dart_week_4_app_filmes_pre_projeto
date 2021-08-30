import 'package:filmes_app/models/genre_model.dart';
import 'package:filmes_app/repositories/genre/genre_repository.dart';

import './genre_service.dart';

class GenreServiceImpl implements GenreService {
  GenreRepository _genreRepository;

  GenreServiceImpl({required GenreRepository genreRepository})
      : _genreRepository = genreRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genreRepository.getGenres();
}
