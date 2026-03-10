import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/core/styles.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          _circle(Icons.add, Colors.grey.shade200),
          const SizedBox(width: 12),
          Expanded(child: _inputField()),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onSend,
            child: _circle(Icons.send, kpimaryColor, iconColor: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _circle(IconData icon, Color bg, {Color iconColor = Colors.grey}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor),
    );
  }

  Widget _inputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Type your message",
          border: InputBorder.none,
      //    hintStyle: Styles.textStyle18.copyWith(color: Colors.grey.shade500),
        ),
      //  style: Styles.textStyle18,
      ),
    );
  }
}
