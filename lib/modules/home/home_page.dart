import 'package:filmes_app/application/ui/filmes_app_icons.dart';
import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:filmes_app/modules/favorites/favorites_bindings.dart';
import 'package:filmes_app/modules/favorites/favorites_page.dart';
import 'package:filmes_app/modules/home/home_controller.dart';
import 'package:filmes_app/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class HomePage extends GetView<HomeController> {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.pageIndex,
            onTap: controller.goToPage,
            items: const [
              BottomNavigationBarItem(
                label: 'Filmes',
                icon: Icon(Icons.movie),
              ),
              BottomNavigationBarItem(
                label: 'Favoritos',
                icon: Icon(FilmesAppIcons.heart_empty),
              ),
              BottomNavigationBarItem(
                label: 'Sair',
                icon: Icon(Icons.logout_outlined),
              ),
            ],
          );
        },
      ),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(1),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              // binding: MoviesBinding(),
            );
          }

          if (settings.name == '/favorites') {
            return GetPageRoute(
              settings: settings,
              page: () => const FavoritesPage(),
              binding: FavoritesBindings(),
            );
          }
          return null;
        },
      ),
    );
  }
}
