import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/car_item_card.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/core/styles.dart';

class SelectAvailableCarsScreen extends StatelessWidget {
  const SelectAvailableCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(logo, width: 150),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available cars for ride',
              style: Styles.headtextStyle24
            ),
            Text(
              '18 Cars Found',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            const SizedBox(height: 12),

            // ✅ ListView.builder داخل ScrollView
            ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CarItemCard(),
                ); 
              },
            ),
          ],
        ),
      ),
    );
  }
}
