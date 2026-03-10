import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_text_field.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/Custom_Socialbutton.dart';

class SendVerificationScreen extends StatefulWidget {
  const SendVerificationScreen({super.key});
  @override
  State<SendVerificationScreen> createState() => _SendVerificationScreenState();
}

class _SendVerificationScreenState extends State<SendVerificationScreen> {
  final TextEditingController _inputController = TextEditingController();
  bool _isLoading = false;
  String? _errorText;
  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String input) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input);
  }

  bool _isValidPhone(String input) {
    String digitsOnly = input.replaceAll(RegExp(r'[^\d]'), '');
    return digitsOnly.length >= 10 && digitsOnly.length <= 15;
  }

  Future<void> _handleSendOTP() async {
    final input = _inputController.text.trim();
    if (input.isEmpty) {
      setState(() {
        _errorText = 'Please enter your email or phone number';
      });
      return;
    }

    if (!_isValidEmail(input) && !_isValidPhone(input)) {
      setState(() {
        _errorText = 'Please enter a valid email or phone number';
      });
      return;
    }
    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        Navigator.of(
          context,
        ).pushNamed("verification", arguments: {'phoneNumber': input});
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorText = 'Failed to send OTP. Please try again.';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormLayout(
      appBarTitle: "",
      title: 'Verifivation email or phone number',
      fields: [
        CustomTextField(
          controller: _inputController,
          text: "Email or Phone Number",
          keyboardType: TextInputType.emailAddress,
        ),
      ],
      actionButton: Padding(
        padding: const EdgeInsets.only(top: 350.0),
        child: CustomButton(
          text: _isLoading ? "Sending..." : "Send OTP",
          type: ButtonType.primary,
          onPressed: _isLoading ? null : _handleSendOTP,
        ),
      ),
      showSocialButtons: false,
    );
  }
}
