import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    Get.offNamed('/login');
  }

}