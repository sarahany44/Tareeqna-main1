import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/verification_cubit/cubit/verification_cubit.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/verification_cubit/cubit/verification_state.dart';
import 'package:tareeqna/core/styles.dart';

class VerificationScreenBody extends StatefulWidget {
  final String email;

  const VerificationScreenBody({
    super.key,
    required this.email,
  });

  @override
  State<VerificationScreenBody> createState() => _VerificationScreenBodyState();
}

class _VerificationScreenBodyState extends State<VerificationScreenBody> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verify() {
    if (_formKey.currentState!.validate()) {
      context.read<VerificationCubit>().verify(
            email: widget.email,
            otp: _otpController.text.trim(),
          );
    }
  }

  void _resend() {
    context.read<VerificationCubit>().resend(widget.email);
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is VerificationSuccess) {
          _showSnackBar('✅ Email verified successfully!');
          
          // Navigate to main screen
          Navigator.pushReplacementNamed(
            context,
            '/main',
          );
        }

        if (state is VerificationFailure) {
          _showSnackBar(state.message, isError: true);
        }

        if (state is ResendSuccess) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 10),
                  Text('OTP Sent'),
                ],
              ),
              content: Text(
                'A new verification code has been sent to:\n\n${widget.email}\n\nPlease check your email (including spam folder).',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }

        if (state is ResendFailure) {
          _showSnackBar(state.message, isError: true);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.email_outlined,
                      size: 60,
                      color: Colors.blue.shade700,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Title
                  Text(
                    'Verify Your Email',
                    style: AppTextStyles.title24,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  // Description
                  Text(
                    'We sent a verification code to',
                    style: AppTextStyles.body14,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 5),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.email,
                      style: AppTextStyles.body16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // OTP Input (using Pinput)
                  Pinput(
                    controller: _otpController,
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter OTP';
                      }
                      if (value.length != 6) {
                        return 'OTP must be 6 digits';
                      }
                      return null;
                    },
                    onCompleted: (pin) {
                      // Auto-verify when all digits are entered
                      _verify();
                    },
                  ),

                  const SizedBox(height: 40),

                  // Verify Button
                  state is VerificationLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _verify,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Verify Email',
                              style: AppTextStyles.button16,
                            ),
                          ),
                        ),

                  const SizedBox(height: 20),

                  // Resend OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive the code? "),
                      state is ResendLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : TextButton(
                              onPressed: _resend,
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Check spam folder hint
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline, 
                            size: 20, 
                            color: Colors.orange),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Please check your spam/junk folder if you don\'t see the email',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}