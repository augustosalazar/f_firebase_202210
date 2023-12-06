import 'dart:async';

import 'package:f_firebase_202210/domain/use_cases/chat_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../data/model/message.dart';

class ChatController extends GetxController {
  ChatUseCase chatUseCase = Get.find();

  var messages = <Message>[].obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  // use the getChats from the ChatUseCase to update the messages list

  void start() {
    messages.clear();

    chatUseCase.getChats().listen((event) {
      print("got new list of messages from firebase of length ${event.length}");
      messages.value = event;
    });

    //newEntryStreamSubscription =
    //    databaseRef.child("msg").onChildAdded.listen(_onEntryAdded);

    //updateEntryStreamSubscription =
    //    databaseRef.child("msg").onChildChanged.listen(_onEntryChanged);
  }

  void stop() {
    //newEntryStreamSubscription.cancel();
    //updateEntryStreamSubscription.cancel();
  }

  // _onEntryAdded(DatabaseEvent event) {
  //   final json = event.snapshot.value as Map<dynamic, dynamic>;
  //   messages.add(Message.fromJson(event.snapshot, json));
  // }

  // _onEntryChanged(DatabaseEvent event) {
  //   var oldEntry = messages.singleWhere((entry) {
  //     return entry.key == event.snapshot.key;
  //   });

  //   final json = event.snapshot.value as Map<dynamic, dynamic>;
  //   messages[messages.indexOf(oldEntry)] =
  //       Message.fromJson(event.snapshot, json);
  // }

  Future<void> updateMsg(Message element) async {
    logInfo('controller updateMsg with key ${element.key}');
    element.textMessage = 'updated';
    await chatUseCase.updateMsg(element);
    // try {
    //   databaseRef
    //       .child('msg')
    //       .child(element.key!)
    //       .set({'text': 'updated', 'uid': element.user});
    // } catch (error) {
    //   logError(error);
    //   return Future.error(error);
    // }
  }

  Future<void> sendMsg(String text) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await chatUseCase.sendMessage(Message(textMessage: text, user: uid));
    // try {
    //   databaseRef.child('msg').push().set({'text': text, 'uid': uid});
    // } catch (error) {
    //   logError(error);
    //   return Future.error(error);
    // }
  }

  Future<void> deleteMsg(Message element, int posicion) async {
    logInfo('controller deleteMsg with key ${element.key}');
    print('controller deleteMsg with key ${element.key}');
    await chatUseCase.deleteMsg(element);

    //.then(
    //      (value) => messages.removeAt(posicion),
    //    );

    //   try {
    //     databaseRef.child('msg').child(element.key!).remove().then(
    //           (value) => messages.removeAt(posicion),
    //         );
    //   } catch (error) {
    //     logError(error);
    //     return Future.error(error);
    //   }
  }
}
