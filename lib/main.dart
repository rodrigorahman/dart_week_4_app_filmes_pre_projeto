import 'package:filmes_app/application/ui/filmes_app_ui_config.dart';
import 'package:filmes_app/modules/login/login_module.dart';
import 'package:filmes_app/modules/movie_detail/movie_detail_module.dart';
import 'package:filmes_app/modules/splash/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'modules/home/home_module.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: FilmesAppUiConfig.title,
      initialRoute: SplashModule.SPLASH_PAGE_ROUTE,
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers
      ],
    ),
  );
}
