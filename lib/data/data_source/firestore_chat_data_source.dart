import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/message.dart';

class FirestoreChatDataSource {
  final FirebaseFirestore _firestore;

  FirestoreChatDataSource(this._firestore);

  // implement getChats that returns a Stream<List<Chat>>
  Stream<List<Message>> getChats() {
    return _firestore
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Message.FromFirestore(doc)).toList());
  }

  Future<void> sendMessage(String chatId, Message message) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toJson());
  }

  Stream<List<Message>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Message.FromFirestore(doc)).toList());
  }
}
