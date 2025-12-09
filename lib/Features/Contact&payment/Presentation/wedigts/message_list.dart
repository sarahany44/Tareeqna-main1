import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Contact&payment/model/messag.dart';
import 'message_bubble.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;
  final ScrollController controller;

  const MessageList({
    super.key,
    required this.messages,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (_, index) {
        final msg = messages[index];
        final showAvatar = index == 0 || messages[index - 1].isMe != msg.isMe;

        return MessageBubble(message: msg, showAvatar: showAvatar);
      },
    );
  }
}
