import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:loggy/loggy.dart';

import '../model/message.dart';
import 'i_chat_data_source.dart';

class FirebaseRealTimeDatabaseChatDataSource implements IChatDataSource {
  final _firebaseDatabase = FirebaseDatabase.instance.ref();

  @override
  Stream<List<Message>> getChatMessages() {
    return _firebaseDatabase
        .child('msg')
        .onValue
        .map((event) {
          if (event.snapshot.value is Map) {
            return Map<String, dynamic>.from(event.snapshot.value as Map);
          } else {
            logError('Error getChatMessages');
            throw TypeError();
          }
        })
        .map((messages) => messages.entries
            .map((entry) => Message.fromJson(entry.value))
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
  }

  @override
  Future<void> addChatMessage(Message message) async {
    final newPostKey = _firebaseDatabase.child('msg').push().key;

    message.key = newPostKey;

    await _firebaseDatabase
        .child('msg')
        .child(newPostKey!)
        .set(message.toJson());
  }

  // implement updateMsg that updates a message in the database
  @override
  Future<void> updateMsg(Message message) async {
    logInfo(
        'updateMsg with key ${message.key} and text ${message.textMessage}');
    await _firebaseDatabase
        .child('msg')
        .child(message.key!)
        .set(message.toJson());
  }

  // implement deleteMsg that deletes a message from the database
  @override
  Future<void> deleteMsg(Message message) async {
    logInfo('deleteMsg with key ${message.key}');
    await _firebaseDatabase.child('msg').child(message.key!).remove();
  }
}
