import 'package:filmes_app/application/ui/auth/auth_service.dart';
import 'package:filmes_app/application/ui/loader/loader_mixin.dart';
import 'package:filmes_app/application/ui/messages/messages_mixin.dart';
import 'package:filmes_app/models/movie_model.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class FavoritesController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MovieModel>[].obs;
  var loading = false.obs;
  var message = Rxn<MessageModel>();

  FavoritesController({
    required MoviesService moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await findMovies();
  }

  Future<void> findMovies() async {
    try {
      loading(true);
      var userId = _authService.user?.uid ?? '';
      var favorites = await _moviesService.getFavoritiesMovies(userId);
      movies.assignAll(favorites);
    } catch (e, s) {
      Logger().e('Erro ao buscar favoritos', e, s);
      message(
          MessageModel.error('Erro', 'Erro ao buscar favoritos'));
    } finally {
      loading(false);
    }
  }

  Future<void> removeFavorite(MovieModel movie) async {
    try {
      loading(true);
      var userId = _authService.user?.uid;
      if(userId != null) {
        await _moviesService.addOrRemoveFavorite(userId, movie.copyWith(favorite: false));
        movies.remove(movie);
        loading(false);
        message(MessageModel.info('Removido', 'Filme removido do favorito'));
      }
    } catch (e) {
      loading(false);
      message(MessageModel.error('Erro', 'Erro ao remover do favorito'));
    } 
    
  }
}
