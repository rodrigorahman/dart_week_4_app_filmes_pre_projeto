import 'package:filmes_app/modules/movies/movies_controller.dart';
import 'package:filmes_app/repositories/genre/genre_repository.dart';
import 'package:filmes_app/repositories/genre/genre_repository_impl.dart';
import 'package:filmes_app/services/genre/genre_service.dart';
import 'package:filmes_app/services/genre/genre_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreRepository>(
        () => GenreRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<GenreService>(
        () => GenreServiceImpl(genreRepository: Get.find()));
    Get.lazyPut(() =>
        MoviesController(moviesService: Get.find(), genreService: Get.find(), authService: Get.find()));
  }
}
