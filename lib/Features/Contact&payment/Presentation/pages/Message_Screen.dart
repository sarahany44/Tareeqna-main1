import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_appbar.dart';
import 'package:tareeqna/Features/Contact&payment/Presentation/wedigts/message_input.dart';
import 'package:tareeqna/Features/Contact&payment/Presentation/wedigts/message_list.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/pages/Calling_Screen.dart';
import 'package:tareeqna/Features/Contact&payment/model/messag.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  final List<Message> messages = [
    Message(
      text: "Good Evening!",
      isMe: false,
      timestamp: "",
      avatar: "assets/images/logo.png",
    ),
    Message(
      text: "Welcome to Car2go Customer Service",
      isMe: false,
      timestamp: "8:29 pm",
    ),
    Message(
      text: "Welcome to Car2go Customer Service",
      isMe: true,
      timestamp: "8:29 pm",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Chat', showLogo: true),
      body: Column(
        children: [
          Expanded(
            child: MessageList(
              messages: messages,
              controller: scrollController,
            ),
          ),
          MessageInput(
            controller: messageController,
            onSend: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CallingScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
