import 'dart:async';
import 'dart:math';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

abstract class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Ola',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Jose',
      userImageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia, vai ter curso hj?',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Marina',
      userImageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Sim vai ter',
      createdAt: DateTime.now(),
      userId: '689',
      userName: 'Bianca',
      userImageUrl: 'assets/images/avatar.png',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );

    _msgs.add(newMessage);

    _controller?.add(_msgs);

    return newMessage;
  }
}
