import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';

class MessageAvatar extends StatelessWidget {
  final bool show;
  final bool isMe;

  const MessageAvatar({super.key, required this.show, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox(width: 36);

    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: isMe
            ? kpimaryColor.withOpacity(0.1)
            : Colors.blue.shade100,
        child: Icon(
          Icons.person,
          color: isMe ? kpimaryColor : Colors.blue.shade700,
        ),
      ),
    );
  }
}
