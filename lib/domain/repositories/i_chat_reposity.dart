import 'package:f_firebase_202210/data/model/message.dart';
import '../../data/data_source/i_chat_data_source.dart';

abstract class IChatRepository {
  final IChatDataSource _chatDataSource;

  IChatRepository(this._chatDataSource);

  Stream<List<Message>> getChats();

  Future<void> sendMessage(Message chat);

  Future<void> updateMsg(Message chat);

  Future<void> deleteMsg(Message chat);
}
