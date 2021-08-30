import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmes_app/application/exceptions/repository_exception.dart';
import 'package:filmes_app/application/rest_client/rest_client.dart';
import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/models/movie_model.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  final FirebaseFirestore _firebaseStore;
  final Logger _logger;

  MoviesRepositoryImpl({
    required RestClient restClient,
    required FirebaseFirestore firebaseStore,
  })  : _restClient = restClient,
        _firebaseStore = firebaseStore,
        _logger = Logger();

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.auth().get<List<MovieModel>>(
      '/movie/popular',
      query: {'page': '1'},
      decoder: (data) {
        final result = data['results'];
        if (result != null) {
          return result.map<MovieModel>((m) => MovieModel.fromMap(m)).toList();
        }
        return [];
      },
    );

    if (result.hasError) {
      _logger.e(result.statusText);
      throw RepositoryException();
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.auth().get<List<MovieModel>>(
      '/movie/top_rated',
      query: {'page': '1'},
      decoder: (data) {
        final result = data['results'];
        if (result != null) {
          return result.map<MovieModel>((m) => MovieModel.fromMap(m)).toList();
        }
        return [];
      },
    );

    if (result.hasError) {
      _logger.e(result.statusText, RepositoryException(), StackTrace.fromString('Erro ao buscar topRated'));
      throw RepositoryException();
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.auth().get<MovieDetailModel?>(
      '/movie/$id',
      query: {
        'page': '1',
        'append_to_response': 'images,credits',
        'include_image_language': 'en'
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );

    if (result.hasError) {
      _logger.e(result.statusText, RepositoryException(), StackTrace.fromString('Erro ao buscar detalhes'));
      throw RepositoryException();
    }

    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = _firebaseStore
          .collection('favorities')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        var docs = favoriteData.docs;
        for (var doc in docs) {
          await doc.reference.delete();
        }
      }
    } on PlatformException catch (e, s) {
      _logger.e('Erro ao buscar favoritos', e, s);
      throw RepositoryException('Erro ao inserir no firebase');
    }
  }

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) async {
    var favoriteMovies = await _firebaseStore
        .collection('favorities')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorites = <MovieModel>[];
    for (var movie in favoriteMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorites;
  }
}
