import 'package:get/get.dart';

class HomeController extends GetxController {
  final _pages = ['/movies', '/favorites'];
  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    
    _pageIndex(page);
    Get.toNamed(_pages[page], id: 1);
  }
}
