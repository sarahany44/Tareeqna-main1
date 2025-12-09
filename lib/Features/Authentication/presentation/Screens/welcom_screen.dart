import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/loginpage.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/signuppage.dart';
import 'package:tareeqna/constant.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 14),

                Image.asset('assets/images/Welcome Screen.png'),

                const SizedBox(height: 15),
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Have a better sharing experience',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                Image.asset(logo),
                Spacer(flex: 2),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff008653),
                    minimumSize: const Size(double.infinity, 50), //
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Create an account",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                SizedBox(height: 15),

                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ), // حدود خضراء
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // حواف شبه الأول
                    ),
                    backgroundColor: Colors.white, // خلفية بيضاء
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff008653),
                    ),
                  ),
                ),

                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
