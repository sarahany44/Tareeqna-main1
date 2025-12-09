import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/set_Password_base.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SetPasswordBaseScreen(
      title: "Set password",
      subtitle: "Set your password",
      buttonText: "Register",
    );
  }
}
