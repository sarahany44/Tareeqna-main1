class Message {
  final String text;
  final bool isMe;
  final String timestamp;
  final String? avatar;

  const Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
    this.avatar,
  });
}
