import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/request_rent_step1.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/car_image_sliders.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/features_section.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/specifications_sections.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/core/styles.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

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

      body: CustomScrollView(
        // padding: const EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 24),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                top: 16,
                left: 16,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // Text('Mustang Shelby GT', style: Styles.headtextStyle24),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amberAccent),
                      Text('4.9(541 reviewers)'),
                    ],
                  ),

                  // car's pictures
                  CarImageSlider(),
                  // car's specifications
                  SpecificationsSections(),

                  //car's features
                  FeaturesSections(),

                  // buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "Book later",
                          type: ButtonType.secondary,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RequestRentStep1(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          text: "Ride Now",
                          type: ButtonType.primary,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const RequestRentStep1(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
