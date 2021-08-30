import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel(this.title, this.message, this.type);
  MessageModel.error(this.title, this.message) : type = MessageType.error;
  MessageModel.info(this.title, this.message) : type = MessageType.info;
}

enum MessageType { error, info }

extension MessageTypeColorExt on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800]!;
      case MessageType.info:
        return Colors.blue[200]!;
      default:
        return Colors.black38;
    }
  }
}
