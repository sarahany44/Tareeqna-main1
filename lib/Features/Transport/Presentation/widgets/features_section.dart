import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/features_list_view.dart';
import 'package:tareeqna/core/styles.dart';

class FeaturesSections extends StatelessWidget {
  const FeaturesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       //   Text('Car features', style: Styles.headtextStyle24opacity),
      
          FeaturesListView(),
        ],
      ),
    );
  }
}
