import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loggy/loggy.dart';

import '../model/message.dart';
import 'i_chat_data_source.dart';

class FirestoreChatDataSource with UiLoggy implements IChatDataSource {
  final FirebaseFirestore _firestore;

  FirestoreChatDataSource() : _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Message>> getChatMessages() {
    return _firestore.collection('chats').snapshots().map((event) {
      return event.docs
          .map((record) => Message.FromFirestore(record.data()))
          .toList();
    });
  }

  @override
  Future<void> addChatMessage(Message message) async {
    loggy.info('firestore addChatMessage with text ${message.textMessage}');
    final newPostKey = _firestore.collection('chats').doc().id;
    message.key = newPostKey;
    await _firestore.collection('chats').doc(newPostKey).set(message.toJson());
  }

  @override
  Future<void> deleteMsg(Message chat) async {
    loggy.info('firestore deleteMsg with key ${chat.key}');
    await _firestore.collection('chats').doc(chat.key).delete();
  }

  @override
  Future<void> updateMsg(Message message) async {
    loggy.info(
        'firestore updateMsg with key ${message.key} and text ${message.textMessage}');
    await _firestore
        .collection('chats')
        .doc(message.key)
        .update(message.toJson());
  }
}
