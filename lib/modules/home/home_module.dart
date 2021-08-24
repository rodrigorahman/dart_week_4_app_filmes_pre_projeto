import 'package:filmes_app/application/modules/module.dart';
import 'package:filmes_app/modules/home/home_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings()
    )
  ];
}
