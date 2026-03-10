import 'package:flutter/material.dart';
import 'package:tareeqna/core/styles.dart';

class SmallCarItemCard extends StatelessWidget {
  const SmallCarItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.2), // ✅ اللون المطلوب
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1ABC9C), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصف العلوي (النصوص على الشمال والصورة على اليمين)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // النصوص على الشمال
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  //    Text('Mustang Shelby GT', style: Styles.headtextStyle20),

                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amberAccent),
                          Text('4.9(541 reviewers)'),
                        ],
                      ),
                    ],
                  ),
                ),

                // الصورة على اليمين
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/image 3.png', // غيّرها حسب صورتك
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
