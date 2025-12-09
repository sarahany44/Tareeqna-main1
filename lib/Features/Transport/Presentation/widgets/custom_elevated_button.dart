import 'package:flutter/material.dart';

enum ButtonType {
  authPrimary,
  authSecondary,
  transportPrimary,
  transportSecondary,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    required this.type,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buttonStyle(type),
        child: Text(text, style: _textStyle(type)),
      ),
    );
  }

  // BUTTON STYLES
  ButtonStyle _buttonStyle(ButtonType type) {
    switch (type) {
      case ButtonType.authPrimary:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF018A53),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );

      case ButtonType.authSecondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF018A53)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );

      case ButtonType.transportPrimary:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF018A53),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );

      case ButtonType.transportSecondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF018A53)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
    }
  }

  //  TEXT STYLES
  TextStyle _textStyle(ButtonType type) {
    switch (type) {
      case ButtonType.authPrimary:
      case ButtonType.transportPrimary:
        return const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        );

      case ButtonType.authSecondary:
      case ButtonType.transportSecondary:
        return const TextStyle(
          color: Color(0xFF018A53),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        );
    }
  }
}
