import 'package:filmes_app/models/movie_model.dart';
import 'package:filmes_app/services/login/login_service.dart';
import 'package:filmes_app/services/movies/movies_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const INDEX_PAGE_EXIT = 2;
  static const NAVIGATOR_INDEX = 1;

  final LoginService _loginService;

  final _pages = ['/movies', '/favorites'];
  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == INDEX_PAGE_EXIT) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[page], id: NAVIGATOR_INDEX);
    }
  }
}
