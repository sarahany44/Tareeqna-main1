import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_text_field.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/Custom_Socialbutton.dart';
import 'package:tareeqna/constant.dart';

class SetPasswordBaseScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String buttonText;

  const SetPasswordBaseScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  State<SetPasswordBaseScreen> createState() => _SetPasswordBaseScreenState();
}

class _SetPasswordBaseScreenState extends State<SetPasswordBaseScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormLayout(
      appBarTitle: "",
      title: widget.title,
      subtitle: widget.subtitle,
      fields: [
        CustomTextField(
          controller: _passwordController,
          text: "Enter Your Password",
          obscureText: !_isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        CustomTextField(
          controller: _confirmPasswordController,
          text: "Confirm Password",
          obscureText: !_isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            },
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "At least 1 number or a special character",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ],
      actionButton: CustomButton(
        text: widget.buttonText,
        type: ButtonType.authPrimary,
        onPressed: () {
          // handle
        },
      ),
      showSocialButtons: false,
    );
  }
}
