import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../model/message.dart';

class FirebaseRealTimeDatabaseDataSource {
  final _firebaseDatabase = FirebaseDatabase.instance.ref();

  FirebaseRealTimeDatabaseDataSource();

  Stream<List<Message>> getChatMessages() {
    return _firebaseDatabase
        .child('msg')
        .onValue
        .map((event) {
          if (event.snapshot.value is Map) {
            return Map<String, dynamic>.from(event.snapshot.value as Map);
          } else {
            print('Error getChatMessages');
            throw TypeError();
          }
        })
        .map((messages) => messages.entries
            .map((entry) => Message.fromJsonSimple(entry.value))
            .toList())
        .transform<List<Message>>(StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            sink.add(data);
          },
          handleError: (error, stackTrace, sink) {
            logInfo('Sending empty list');
            sink.add([]);
          },
        ));
    ;
  }

  // Future<List<Message>> getChatMessages() async {
  //   final snapshot = await _firebaseDatabase.ref().child('chat').once();
  //   final messages = snapshot.value as Map<String, dynamic>;
  //   return messages.entries
  //       .map((entry) => Message.fromJson(entry.value))
  //       .toList();
  // }

  Future<void> addChatMessage(Message message) async {
    final newPostKey = _firebaseDatabase.child('msg').push().key;

    message.key = newPostKey;

    await _firebaseDatabase
        .child('msg')
        .child(newPostKey!)
        .set(message.toJson());
  }

  // implement updateMsg that updates a message in the database
  Future<void> updateMsg(Message message) async {
    logInfo(
        'updateMsg with key ${message.key} and text ${message.textMessage}');
    await _firebaseDatabase
        .child('msg')
        .child(message.key!)
        .set(message.toJson());
  }

  // implement deleteMsg that deletes a message from the database
  Future<void> deleteMsg(Message message) async {
    logInfo('deleteMsg with key ${message.key}');
    await _firebaseDatabase.child('msg').child(message.key!).remove();
  }
}
