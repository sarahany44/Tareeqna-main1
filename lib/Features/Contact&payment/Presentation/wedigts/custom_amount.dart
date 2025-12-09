import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_text_field.dart';

class CustomAmountField extends StatelessWidget {
  final TextEditingController controller;

  const CustomAmountField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      text: "Custom amount",
      keyboardType: TextInputType.number,
    );
  }
}
