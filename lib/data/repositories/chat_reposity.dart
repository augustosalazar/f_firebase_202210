import 'package:f_firebase_202210/data/model/message.dart';

import '../data_source/firebase_real_time_database_chat_data_source.dart';

class ChatRepository {
  final FirebaseRealTimeDatabaseDataSource _chatDataSource;

  ChatRepository(this._chatDataSource);

  Stream<List<Message>> getChats() {
    return _chatDataSource.getChatMessages();
  }

  Future<void> sendMessage(Message chat) async {
    await _chatDataSource.addChatMessage(chat);
  }

  Future<void> updateMsg(Message chat) async {
    await _chatDataSource.updateMsg(chat);
  }

  Future<void> deleteMsg(Message chat) async {
    await _chatDataSource.deleteMsg(chat);
  }
}
