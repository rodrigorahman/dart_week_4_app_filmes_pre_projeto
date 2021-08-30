import 'package:filmes_app/application/ui/auth/auth_service.dart';
import 'package:filmes_app/application/ui/loader/loader_mixin.dart';
import 'package:filmes_app/application/ui/messages/messages_mixin.dart';
import 'package:filmes_app/models/genre_model.dart';
import 'package:filmes_app/models/movie_model.dart';
import 'package:filmes_app/services/genre/genre_service.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MoviesController extends GetxController with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;
  final GenreService _genreService;
  final AuthService _authService;
  var popularMovies = <MovieModel>[].obs;
  var topMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topMoviesOriginal = <MovieModel>[];

  var genres = <GenreModel>[].obs;
  var loading = false.obs;
  var message = Rxn<MessageModel>();
  final genreSelected = Rxn<GenreModel>();

  MoviesController({
    required MoviesService moviesService,
    required GenreService genreService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _genreService = genreService,
        _authService = authService;

  int get genreIdSelected => genreSelected.value?.id ?? 0;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    loading(true);
    _getMovies();
  }

  Future<void> _getMovies() async {
    var futures = <Future>[];
    var userId = _authService.user?.uid ?? '';
    final favoritesMap = await getFavorites(userId);

    futures.add(_moviesService
        .getPopularMovies()
        .then((movies) => _checkIsFavorite(movies, favoritesMap)));

    futures.add(_moviesService
        .getTopRated()
        .then((movies) => _checkIsFavorite(movies, favoritesMap)));

    futures.add(_genreService.getGenres());

    Future.wait(futures).then((result) {
      _popularMoviesOriginal = result[0];
      popularMovies.assignAll(_popularMoviesOriginal);

      _topMoviesOriginal = result[1];
      topMovies.assignAll(_topMoviesOriginal);
      genres.assignAll(result[2]);

      loading(false);
    }).catchError((error) {
      loading(false);
      message(MessageModel.error('Erro', 'Erro ao buscar dados'));
    });
  }

  List<MovieModel> _checkIsFavorite(
          List<MovieModel> movies, Map<int, MovieModel> favorites) =>
      movies
          .map((m) => m.copyWith(favorite: favorites.containsKey(m.id)))
          .toList();

  void filterMoviesByGenre(GenreModel? genreModel) {
    var genreFilter = genreModel;

    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }
    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPopular = _popularMoviesOriginal
          .where((movie) => movie.genres.contains(genreFilter!.id));
      var newTopRated = _topMoviesOriginal
          .where((movie) => movie.genres.contains(genreFilter!.id));
      popularMovies.assignAll(newPopular);
      topMovies.assignAll(newTopRated);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topMovies.assignAll(_topMoviesOriginal);
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopular = _popularMoviesOriginal
          .where((movie) => movie.title.toLowerCase().contains(title));
      var newTopRated = _topMoviesOriginal
          .where((movie) => movie.title.toLowerCase().contains(title));
      popularMovies.assignAll(newPopular);
      topMovies.assignAll(newTopRated);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topMovies.assignAll(_topMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    try {
      final user = _authService.user;
      loading(true);
      if (user != null) {
        await _moviesService.addOrRemoveFavorite(
            user.uid, movie.copyWith(favorite: !movie.favorite));
        await _getMovies();
      }
    } catch (e, s) {
      Logger().e(e, s);
      message(
        MessageModel.error('Erro Favoritar', 'Erro ao favoritar filme'),
      );
    } finally {
      loading(false);
    }
  }

  Future<Map<int, MovieModel>> getFavorites(String userId) async {
    final favorites = await _moviesService.getFavoritiesMovies(userId);
    return <int, MovieModel>{
      for (var fav in favorites) fav.id: fav,
    };
  }
}
