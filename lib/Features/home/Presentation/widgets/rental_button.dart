import 'package:flutter/material.dart';

class RentalButton extends StatelessWidget {
  const RentalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xff00A86B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          "Rental",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
