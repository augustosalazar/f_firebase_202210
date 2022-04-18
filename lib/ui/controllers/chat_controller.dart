import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../data/model/message.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  void start() {
    messages.clear();

    newEntryStreamSubscription =
        databaseRef.child("msg").onChildAdded.listen(_onEntryAdded);

    updateEntryStreamSubscription =
        databaseRef.child("msg").onChildChanged.listen(_onEntryChanged);
  }

  void stop() {
    newEntryStreamSubscription.cancel();
    updateEntryStreamSubscription.cancel();
  }

  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    messages.add(Message.fromJson(event.snapshot, json));
  }

  _onEntryChanged(DatabaseEvent event) {
    var oldEntry = messages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    final json = event.snapshot.value as Map<dynamic, dynamic>;
    messages[messages.indexOf(oldEntry)] =
        Message.fromJson(event.snapshot, json);
  }

  Future<void> updateMsg(Message element) async {
    try {
      databaseRef
          .child('msg')
          .child(element.key!)
          .set({'text': 'updated', 'uid': element.user});
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }

  Future<void> sendMsg(String text) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      databaseRef.child('msg').push().set({'text': text, 'uid': uid});
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }

  Future<void> deleteMsg(Message element, int posicion) async {
    try {
      databaseRef.child('msg').child(element.key!).remove().then(
            (value) => messages.removeAt(posicion),
          );
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }
}
