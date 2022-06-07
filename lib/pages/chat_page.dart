import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: SizedBox(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text('Sair'),
                    ],
                  ),
                ),
              )
            ],
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            onChanged: (value) {
              if (value == 'logout') {
                AuthService().logout();
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [Expanded(child: Messages()), NewMessage()],
        ),
      ),
    );
  }
}
