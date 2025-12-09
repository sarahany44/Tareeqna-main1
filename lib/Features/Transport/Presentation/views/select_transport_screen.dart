import 'package:flutter/material.dart';
import 'package:tareeqna/core/styles.dart';
import 'select_available_cars_screen.dart';

class SelectTransportScreen extends StatelessWidget {
  const SelectTransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transports = [
      {'title': 'Car', 'image': 'assets/images/view-3d-car.jpg'},
      {'title': 'Buss', 'image': 'assets/images/bus.jpg'},
      {'title': 'Train', 'image': 'assets/images/train.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Select your transport',
          style: Styles.headtextStyle24,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: transports.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = transports[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {

                if (item['title'] == 'Car') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SelectAvailableCarsScreen(),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF1ABC9C),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child:  ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(item['image']!, fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
