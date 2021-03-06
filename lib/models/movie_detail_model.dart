import 'dart:convert';

import 'package:filmes_app/models/genre_model.dart';

import 'cast_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  final bool favorite;

  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
    this.favorite = false
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stars': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? '',
      genres: List<GenreModel>.from(
          map['genres'].map((x) => GenreModel.fromMap(x)) ?? const []),
      
      urlImages: List<dynamic>.from(map['images']['posters'] ?? [])
          .map<String>((i) => i['file_path'])
          .toList(),

      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies:
          List<dynamic>.from(map['production_companies'] ?? const []).map<String>((p) => p['name']).toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
          map['credits']['cast'].map<CastModel>((x) => CastModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));

  MovieDetailModel copyWith({
    String? title,
    double? stars,
    List<GenreModel>? genres,
    List<String>? urlImages,
    DateTime? releaseDate,
    String? overview,
    List<String>? productionCompanies,
    String? originalLanguage,
    List<CastModel>? cast,
    bool? favorite,
  }) {
    return MovieDetailModel(
      title: title ?? this.title,
      stars: stars ?? this.stars,
      genres: genres ?? this.genres,
      urlImages: urlImages ?? this.urlImages,
      releaseDate: releaseDate ?? this.releaseDate,
      overview: overview ?? this.overview,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      cast: cast ?? this.cast,
      favorite: favorite ?? this.favorite,
    );
  }
}
