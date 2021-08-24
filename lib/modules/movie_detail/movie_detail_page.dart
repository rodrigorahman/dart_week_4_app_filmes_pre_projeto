import 'package:filmes_app/application/ui/filmes_app_icons.dart';
import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_content/movie_detail_content.dart';
import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_header.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  final bool favorite = false;

  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MovieDetailHeader(),
            MovieDetailContent(),
          ],
        ),
      ),
    );
  }
}
