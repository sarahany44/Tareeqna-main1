import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tareeqna/constant.dart';
import 'setpassword.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_appbar.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/buildOTP.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/resend_otp.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';

class VerificationPage extends StatefulWidget {
  final String phoneNumber;
  const VerificationPage({super.key, required this.phoneNumber});
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: "",
                showLogo: true,
                onBack: () => Navigator.pop(context),
              ),
              const SizedBox(height: 60),
              Expanded(
                child: Column(
                  children: [
                    _buildTitle(),
                    const SizedBox(height: 20),
                    _buildSubtitle(),
                    const SizedBox(height: 20),
                    Buidotp(
                      length: 5,
                      onCompleted: (otpCode) {
                        print('OTP entered: $otpCode');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SetPasswordPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    ResendSection(
                      onResend: () {
                        print('Resend OTP called!');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('OTP sent successfully'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    _buildVerifyUpButton(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Center(
      child: Text(
        'Phone verification',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSubtitle() {
    return const Center(
      child: Text(
        'Enter your OTP code',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  void _verifyOTP() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SetPasswordPage()),
        );
      }
    });
  }

  Widget _buildVerifyUpButton() {
    return CustomButton(
      text: "Verify",
      type: ButtonType.authPrimary,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SetPasswordPage()),
        );
      },
    );
  }
}
