import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmes_app/application/rest_client/rest_client.dart';
import 'package:filmes_app/repositories/login/login_repository.dart';
import 'package:filmes_app/repositories/login/login_repository_impl.dart';
import 'package:filmes_app/repositories/movies/movies_repository.dart';
import 'package:filmes_app/repositories/movies/movies_repository_impl.dart';
import 'package:filmes_app/services/login/login_service.dart';
import 'package:filmes_app/services/login/login_service_impl.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:filmes_app/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.create(() => RestClient());
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);

    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(
            restClient: Get.find(), firebaseStore: FirebaseFirestore.instance),
        fenix: true);
    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()),
        fenix: true);

  }
}
