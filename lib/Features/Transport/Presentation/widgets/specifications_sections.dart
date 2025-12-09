import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/specification_list_item.dart';
import 'package:tareeqna/core/styles.dart';

class SpecificationsSections extends StatelessWidget {
  const SpecificationsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Specification', style: Styles.headtextStyle24opacity),

        SizedBox(
          height: 90,
          child: ListView.builder(
           scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(right: 8, top: 16),
              child: Specificationlistitem(),
            );
          }),
        )
        //Row(children: [Specificationlistitem()]),
      ],
    );
  }
}

