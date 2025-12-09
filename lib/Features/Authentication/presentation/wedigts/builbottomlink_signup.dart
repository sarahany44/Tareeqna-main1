import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/loginpage.dart';

class BottomLink extends StatelessWidget {
  const BottomLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          ),
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: Color.fromRGBO(0, 137, 84, 0.896),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
