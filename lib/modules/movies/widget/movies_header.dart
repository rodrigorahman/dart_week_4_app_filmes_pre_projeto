import 'package:filmes_app/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 200,
      child: Stack(
        children: [
          SizedBox(
            width: Get.width,
            child: Image.asset(
              'assets/images/home_header_background.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width * .90,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                onChanged: (value) => controller.filterByName(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  filled: true,
                  labelText: 'Procurar filme',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero
                  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
