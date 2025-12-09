import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/complete_profile.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/loginpage.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/sendverfication.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/setnewpassword.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/signuppage.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/verification.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/welcom_screen.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/pages/Calling_Screen.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/pages/Message_Screen.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/pages/Payment.dart';
import 'package:tareeqna/Features/Contact&payment/Presentation/pages/Payment.dart';
import 'package:tareeqna/Features/Home/Presentation/views/home_screen.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/car_details_screen.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/request_rent_step1.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/select_available_cars_screen.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/select_transport_screen.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/thank_you_screen.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/payment_method.dart';
import 'package:tareeqna/constant.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Anywhere you are",
      "subtitle":
          "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
      "image": "assets/images/onboarding_p1.png",
    },
    {
      "title": "At anytime",
      "subtitle":
          "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
      "image": "assets/images/onboarding_p2.png",
    },
    {
      "title": "Book your car",
      "subtitle":
          "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
      "image": "assets/images/onboarding_p3.png",
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CallingScreen()), // next screen
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // زر Skip
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: _skip,
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),

                      Image.asset(
                        onboardingData[index]['image']!,
                        height: 250,
                        fit: BoxFit.contain,
                      ),

                      Column(
                        children: [
                          Text(
                            onboardingData[index]['title']!,
                            style: Theme.of(context).textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            onboardingData[index]['subtitle']!,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      Image.asset(logo),

                      ElevatedButton(
                        onPressed: _nextPage,
                        child: _currentPage == onboardingData.length - 1
                            ? const Text("Go")
                            : const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
