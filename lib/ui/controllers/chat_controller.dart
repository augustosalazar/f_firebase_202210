import 'package:get/get.dart';

import '../../data/model/message.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;

  void start() {}

  void stop() {}

  updateMsg(element) {}

  deleteMsg(element, int posicion) {}

  sendMsg(String text) {}
}
