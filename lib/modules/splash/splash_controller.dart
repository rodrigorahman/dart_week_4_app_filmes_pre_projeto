import 'package:filmes_app/application/ui/auth/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Get.put(AuthService()).init();
  }
}
