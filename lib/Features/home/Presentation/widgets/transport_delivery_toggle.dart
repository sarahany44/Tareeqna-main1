import 'package:flutter/material.dart';

class TransportDeliveryToggle extends StatelessWidget {
  const TransportDeliveryToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xff00A86B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Transport",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xffD6F3EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Delivery",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
