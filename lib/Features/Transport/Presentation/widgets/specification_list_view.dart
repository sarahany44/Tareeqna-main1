
import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/specification_list_item.dart';

class SpecificationListView extends StatelessWidget {
  const SpecificationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        shrinkWrap: true,
       scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(right: 8, top: 16),
          child: Specificationlistitem(),
        );
      }),
    );
  }
}

