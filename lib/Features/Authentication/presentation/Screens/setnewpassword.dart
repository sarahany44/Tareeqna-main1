import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/set_Password_base.dart';
import 'package:tareeqna/widgets/app_text.dart';
import 'package:tareeqna/widgets/custom_text_field.dart';
import 'package:tareeqna/constant.dart';

class SetnewPasswordPage extends StatelessWidget {
  const SetnewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SetPasswordBaseScreen(
      title: "Set New Password",
      subtitle: "Set your new password",
      buttonText: "Save",
    );
  }
}
