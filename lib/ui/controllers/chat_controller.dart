import 'dart:async';

import 'package:f_firebase_202210/domain/use_cases/chat_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../data/model/message.dart';

class ChatController extends GetxController {
  ChatUseCase chatUseCase = Get.find();
  var messages = <Message>[].obs;
  late StreamSubscription<List<Message>> streamSubscription;

  void start() {
    messages.clear();

    streamSubscription = chatUseCase.getChats().listen((event) {
      logInfo(
          "got new list of messages from firebase of length ${event.length}");
      messages.value = event;
    });
  }

  void stop() async {
    streamSubscription.cancel();
  }

  Future<void> updateMsg(Message element) async {
    logInfo('controller updateMsg with key ${element.key}');
    element.textMessage = 'updated';
    await chatUseCase.updateMsg(element);
  }

  Future<void> sendMsg(String text) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await chatUseCase.sendMessage(Message(textMessage: text, user: uid));
  }

  Future<void> deleteMsg(Message element, int posicion) async {
    logInfo('controller deleteMsg with key ${element.key}');
    logInfo('controller deleteMsg with key ${element.key}');
    await chatUseCase.deleteMsg(element);
  }
}
