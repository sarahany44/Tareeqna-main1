import 'package:flutter/material.dart';

class CarImageSlider extends StatefulWidget {
  const CarImageSlider({super.key});

  @override
  State<CarImageSlider> createState() => _CarImageSliderState();
}

class _CarImageSliderState extends State<CarImageSlider> {
  // 🔹 مصفوفة صور العربيات
  final List<String> carImages = [
    'assets/images/front.png',
    'assets/images/side.png',
    'assets/images/back.png',
    'assets/images/inside.jpg',
  ];

  int currentIndex = 0; // المؤشر الحالي

  void showNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % carImages.length;
    });
  }

  void showPreviousImage() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + carImages.length) % carImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1ABC9C), width: 1),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ✅ الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              carImages[currentIndex],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 سهم الشمال
          Positioned(
            left: 8,
            child: IconButton(
              onPressed: showPreviousImage,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 28,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.4),
              ),
            ),
          ),

          // 🔹 سهم اليمين
          Positioned(
            right: 8,
            child: IconButton(
              onPressed: showNextImage,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 28,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.4),
              ),
            ),
          ),

          // 🔸 مؤشرات تحت الصورة (نقاط)
          Positioned(
            bottom: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carImages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
