import 'package:filmes_app/application/modules/module.dart';
import 'package:filmes_app/modules/login/login_bindings.dart';
import 'package:filmes_app/modules/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBindings()
    )
  ];
}
