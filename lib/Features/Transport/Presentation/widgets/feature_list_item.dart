import 'package:flutter/material.dart';

class Featurelistitem extends StatelessWidget {
  const Featurelistitem({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.2),
        border: Border.all(
          color: Colors.greenAccent, // نفس اللون لكن بدون شفافية (أوضح)
          width: 2.5, // درجة سمك الـ border
        ),
        borderRadius: BorderRadius.circular(12), // اختياري - شكل الحواف
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: const [
            Text('2500hp'),
            Spacer(),
            Text('760 hp'),
          ],
        ),
      ),
    );
  }
}
