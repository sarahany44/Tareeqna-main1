import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/Custom_Socialbutton.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/sendverfication.dart';
import 'package:tareeqna/Features/Home/Presentation/views/home_screen.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/signuppage.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_text_field.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormLayout(
      appBarTitle: "",
      title: 'Sign in with your email or phone number',
      fields: [
        CustomTextField(
          controller: _emailController,
          text: "Email or Phone Number",
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextField(
          controller: _passwordController,
          text: "Password",
          isPassword: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SendVerificationScreen(),
                ),
              );
            },
            child: const Text(
              "Forget password?",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ),
      ],
      actionButton: CustomButton(
        text: "Sign In",
        type: ButtonType.authPrimary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
      ),
      bottomLink: _buildBottomLink(context),
    );
  }

  Widget _buildBottomLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SignUpPage()),
          ),
          child: const Text(
            "Sign up",
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
