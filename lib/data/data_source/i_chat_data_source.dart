import 'package:f_firebase_202210/data/model/message.dart';

abstract class IChatDataSource {
  Stream<List<Message>> getChatMessages();
  Future<void> addChatMessage(Message message);
  Future<void> updateMsg(Message message);
  Future<void> deleteMsg(Message chat);
}
