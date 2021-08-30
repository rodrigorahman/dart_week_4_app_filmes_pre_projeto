import 'package:filmes_app/application/ui/loader/loader_mixin.dart';
import 'package:filmes_app/application/ui/messages/messages_mixin.dart';
import 'package:filmes_app/models/movie_detail_model.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;
  final _movie = Rxn<MovieDetailModel>();
  final message = Rxn<MessageModel>();
  final loading = false.obs;

  MovieDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  MovieDetailModel? get movie => _movie.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    messageListener(message);
    loaderListener(loading);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      _movie(await _moviesService.getDetail(movieId));
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel('Erro', 'Erro ao buscar filmes', MessageType.error));
    }
  }
}
