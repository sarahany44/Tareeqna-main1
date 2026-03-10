import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_cubit.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/register_cubit/register_state.dart';
import 'package:tareeqna/Features/main_layout/Presentation/views/main_screen.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/widgets/app_text.dart';
import 'package:tareeqna/widgets/custom_text_field.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/complete_profile.dart';

class SetPasswordBaseScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final bool isReset; // true = reset password, false = set password
  final String phoneNumber;

  const SetPasswordBaseScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.isReset = false,
    this.phoneNumber = '',
  });

  @override
  State<SetPasswordBaseScreen> createState() => _SetPasswordBaseScreenState();
}

class _SetPasswordBaseScreenState extends State<SetPasswordBaseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // bool _isPasswordVisible = false;
  // bool _isConfirmPasswordVisible = false;


  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final password = _passwordController.text.trim();

    if (widget.isReset) {
      context.read<AuthCubit>().resetPassword(password: password);
    } else {
      context.read<AuthCubit>().setPassword(password: password);
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          _showSnackBar(state.message, isError: true);
        }

        if (state is AuthPasswordSet ) {
          _showSnackBar('Password saved successfully!');
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) =>  CompleteProfilePage(
                phoneNumber: widget.phoneNumber,
              )),
                  (route) => false,
            );
          });
        }
        if (state is AuthPasswordSet ) {
          _showSnackBar('Password saved successfully!');
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const MainScreen()),
                  (route) => false,
            );
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // AppBar Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                          ),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 20,
                            color: Colors.black,
                          ),
                          label: const Text(
                            "Back",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        Image.asset(logo, width: 120, height: 100),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Title
                    Center(
                      child: AppText(
                        widget.title,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    Center(
                      child: AppText(
                        widget.subtitle,
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Password Field
                    CustomTextField(
                      controller: _passwordController,
                      label: "Enter Your New Password",
                      isPassword: true,
                    ),

                    const SizedBox(height: 16),

                    // Confirm Password Field
                    CustomTextField(
                      controller: _confirmPasswordController,
                      label: "Confirm Password",
                      isPassword: true,
                    ),

                    const SizedBox(height: 8),

                    const AppText(
                      "At least 1 number or a special character",
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),

                    const Spacer(),

                    // Button
                    state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: const Color(0xff008653),
                        ),
                        onPressed: _submit,
                        child: Text(
                          widget.buttonText,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}