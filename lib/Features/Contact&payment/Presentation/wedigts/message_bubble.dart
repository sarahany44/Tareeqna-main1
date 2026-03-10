import 'package:flutter/material.dart';
import 'package:tareeqna/core/styles.dart';
import 'package:tareeqna/Features/Contact&payment/model/messag.dart';
import 'message_avatar.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool showAvatar;

  const MessageBubble({
    super.key,
    required this.message,
    required this.showAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.isMe
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!message.isMe) MessageAvatar(show: showAvatar),
        Flexible(child: _buildBubble(context)),
        if (message.isMe) MessageAvatar(show: showAvatar, isMe: true),
      ],
    );
  }

  Widget _buildBubble(BuildContext context) {
    return Column(
      crossAxisAlignment: message.isMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: message.isMe ? Colors.green.shade100 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message.text,
            //style: Styles.textStyle18.copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          message.timestamp,
         // style: Styles.textStyle14.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
