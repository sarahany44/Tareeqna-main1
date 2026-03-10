import 'package:flutter/material.dart';
import 'package:tareeqna/Features/onBoarding/Presentation/views/on_boarding_screen.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/SetPassword.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/setnewpassword.dart';

void main() {
  runApp(const TAREEQNA());
}

// theme
class TAREEQNA extends StatelessWidget {
  const TAREEQNA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAREEQNA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1ABC9C),

        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1ABC9C),
           // shape: const CircleBorder(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),

     //home: const OnboardingScreen(),
    ///  home: const SetnewPasswordPage(),
   home: const SetPasswordPage(),
      // OnboardingScreen(),
    );
  }
}
