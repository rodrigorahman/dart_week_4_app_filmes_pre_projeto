import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin {
  void loaderInitControll(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
          const _LoaderDialog(),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}

class _LoaderDialog extends StatelessWidget {
  const _LoaderDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
