import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/feature_list_item.dart';

class FeaturesListView extends StatelessWidget {
  const FeaturesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(), 
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8, top: 16),
            child: Featurelistitem(),
          );
        },
      ),
    );
  }
}
