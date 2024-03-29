import 'package:f_firebase_202210/data/model/message.dart';
import '../repositories/i_chat_reposity.dart';

class ChatUseCase {
  final IChatRepository _chatRepository;

  ChatUseCase(this._chatRepository);

  Stream<List<Message>> getChats() {
    return _chatRepository.getChats();
  }

  Future<void> sendMessage(Message chat) async {
    await _chatRepository.sendMessage(chat);
  }

  Future<void> updateMsg(Message chat) async {
    await _chatRepository.updateMsg(chat);
  }

  Future<void> deleteMsg(Message chat) async {
    await _chatRepository.deleteMsg(chat);
  }
}
