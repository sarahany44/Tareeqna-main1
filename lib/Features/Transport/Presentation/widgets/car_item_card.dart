import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/car_details_screen.dart';

class CarItemCard extends StatelessWidget {
  const CarItemCard({super.key});

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
                    children: const [
                      Text(
                        'BMW Cabrio',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Automatic • 3 seats • Octane',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '800m (5 mins away)',
                        style: TextStyle(color: Colors.black87, fontSize: 13),
                      ),
                    ],
                  ),
                ),

                // الصورة على اليمين
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Car(1).png', // غيّرها حسب صورتك
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // الزر في الأسفل
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) {
                        return CarDetailsScreen();
                      },
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1ABC9C)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                child: const Text(
                  'View car details',
                  style: TextStyle(
                    color: Color(0xFF1ABC9C),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
