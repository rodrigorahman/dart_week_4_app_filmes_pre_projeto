import 'package:filmes_app/application/exceptions/repository_exception.dart';
import 'package:filmes_app/application/rest_client/rest_client.dart';
import 'package:filmes_app/models/genre_model.dart';
import 'package:logger/logger.dart';

import './genre_repository.dart';

class GenreRepositoryImpl implements GenreRepository {
  final RestClient _restClient;
  final Logger logger;

  GenreRepositoryImpl({required RestClient restClient})
      : _restClient = restClient,
        logger = Logger();

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.auth().get<List<GenreModel>>(
      '/genre/movie/list',
      query: {'page': '1'},
      decoder: (data) {
        final result = data['genres'];
        if (result != null) {
          return result.map<GenreModel>((m) => GenreModel.fromMap(m)).toList();
        }
        return [];
      },
    );

    if (result.hasError) {
      logger.e(result.statusText);
      throw RepositoryException();
    }

    return result.body ?? <GenreModel>[];
  }
}
