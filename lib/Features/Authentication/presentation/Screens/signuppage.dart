import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/Custom_Socialbutton.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/complete_profile.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/sendverfication.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/verification.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/builbottomlink_signup.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_text_field.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_country_piker.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_mobile.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_dropdown.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/buildterm_check.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _gender;
  bool _isAgreed = false;
  CountryCode _countryCode = CountryCode.fromCountryCode('EG');
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormLayout(
      appBarTitle: '',
      title: 'Sign up with your email or phone number',
      fields: [
        CustomTextField(
          controller: _nameController,
          text: "Name",
          keyboardType: TextInputType.name,
        ),
        CustomTextField(
          controller: _emailController,
          text: "Email",
          keyboardType: TextInputType.emailAddress,
        ),
        CustomMobileField(
          controller: _phoneNumberController,
          initialCountry: _countryCode,
          onCountryChanged: (code) => setState(() => _countryCode = code),
        ),
        CustomDropdownField(
          hint: "Select Gender",
          items: const ["Male", "Female", "Other"],
          value: _gender,
          onChanged: (value) => setState(() => _gender = value),
        ),
        const SizedBox(height: 10),
        TermsCheckbox(
          initialValue: _isAgreed,
          onChanged: (val) => setState(() => _isAgreed = val),
        ),
      ],
      actionButton: CustomButton(
        text: "Sign Up",
        type: ButtonType.authPrimary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CompleteProfilePage(phoneNumber: "1"),
            ),
          );
        },
      ),
      bottomLink: const BottomLink(),
    );
  }

  void _handleSignUp() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all fields")),
      );
      return;
    }
    final fullPhone =
        "${_countryCode.dialCode}${_phoneNumberController.text.trim()}";
  }
}
