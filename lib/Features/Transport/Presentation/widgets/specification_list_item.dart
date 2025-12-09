import 'package:flutter/material.dart';

class Specificationlistitem extends StatelessWidget {
  const Specificationlistitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.2),
        border: Border.all(
          color: Colors.greenAccent, // نفس اللون لكن بدون شفافية (أوضح)
          width: 2.5, // درجة سمك الـ border
        ),
        borderRadius: BorderRadius.circular(12), // اختياري - شكل الحواف
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.battery_0_bar, color: Colors.black54),
          Text('Max.Power', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('2500hp', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
