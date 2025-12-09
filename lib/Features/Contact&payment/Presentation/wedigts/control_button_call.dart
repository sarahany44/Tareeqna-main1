import 'package:flutter/material.dart';

class CallControls extends StatelessWidget {
  final bool isTalking;
  final VoidCallback onMainButtonTap;

  const CallControls({
    Key? key,
    required this.isTalking,
    required this.onMainButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildControlButton(icon: Icons.camera_alt_outlined, onTap: () {}),
          _buildControlButton(icon: Icons.mic_off_outlined, onTap: () {}),
          _buildMainControlButton(
            icon: isTalking ? Icons.call_end : Icons.call,
            color: isTalking ? Colors.red : const Color(0xFF00C851),
            onTap: onMainButtonTap,
          ),
          _buildControlButton(icon: Icons.videocam_outlined, onTap: () {}),
          _buildControlButton(icon: Icons.more_horiz, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFE8F5E8),
      ),
      child: Icon(icon, color: Colors.grey, size: 24),
    ),
  );

  Widget _buildMainControlButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(icon, color: Colors.white, size: 28),
    ),
  );
}
