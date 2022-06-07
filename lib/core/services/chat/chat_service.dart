import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage> save(String text, ChatUser user);
}
