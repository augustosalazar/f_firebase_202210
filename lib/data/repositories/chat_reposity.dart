import 'package:f_firebase_202210/data/model/message.dart';
import '../../domain/repositories/i_chat_reposity.dart';
import '../data_source/i_chat_data_source.dart';

class ChatRepository implements IChatRepository {
  final IChatDataSource _chatDataSource;

  ChatRepository(this._chatDataSource);

  @override
  Stream<List<Message>> getChats() {
    return _chatDataSource.getChatMessages();
  }

  @override
  Future<void> sendMessage(Message chat) async {
    await _chatDataSource.addChatMessage(chat);
  }

  @override
  Future<void> updateMsg(Message chat) async {
    await _chatDataSource.updateMsg(chat);
  }

  @override
  Future<void> deleteMsg(Message chat) async {
    await _chatDataSource.deleteMsg(chat);
  }
}
