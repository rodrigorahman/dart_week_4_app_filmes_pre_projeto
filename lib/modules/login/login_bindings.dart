import 'package:filmes_app/repositories/login/login_repository.dart';
import 'package:filmes_app/repositories/login/login_repository_impl.dart';
import 'package:filmes_app/services/login/login_service.dart';
import 'package:filmes_app/services/login/login_service_impl.dart';
import 'package:get/get.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginService: Get.find()));
  }
}
