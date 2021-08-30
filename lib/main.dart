import 'package:filmes_app/application/bindings/application_bindings.dart';
import 'package:filmes_app/application/ui/filmes_app_ui_config.dart';
import 'package:filmes_app/modules/login/login_module.dart';
import 'package:filmes_app/modules/movie_detail/movie_detail_module.dart';
import 'package:filmes_app/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/home_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final remoteConfig = RemoteConfig.instance;

  // await remoteConfig.setConfigSettings(RemoteConfigSettings(
  //   fetchTimeout: const Duration(seconds: 1), // a fetch will wait up to 10 seconds before timing out
  //   minimumFetchInterval: const Duration(seconds: 10), // fetch parameters will be cached for a maximum of 1 hour
  // ));

  remoteConfig.fetchAndActivate();

  runApp(
    GetMaterialApp(
      initialBinding: ApplicationBindings(),
      title: FilmesAppUiConfig.title,
      initialRoute: SplashModule.SPLASH_PAGE_ROUTE,
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    ),
  );
}
