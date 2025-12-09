import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_appbar.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_mobile.dart';
import 'package:tareeqna/Features/Authentication/presentation/Screens/loginpage.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_profile.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/profileform.dart';

class CompleteProfilePage extends StatefulWidget {
  final String phoneNumber;
  const CompleteProfilePage({super.key, required this.phoneNumber});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _fullNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _streetController = TextEditingController();

  List<String> _cities = [];
  List<String> _districts = [];
  String? _selectedCity;
  String? _selectedDistrict;
  CountryCode _countryCode = CountryCode.fromCountryCode('EG');

  @override
  void initState() {
    super.initState();
    _mobileController.text = widget.phoneNumber.replaceFirst('+20', '');
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _streetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomAppBar(showBrandName: true, showLogo: true),
              const SizedBox(height: 30),
              CustomProfilePictureSection(
                onPickImage: _handleImagePicker,
                showCameraIcon: true,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: ProfileFormSection(
                    fullNameController: _fullNameController,
                    mobileController: _mobileController,
                    emailController: _emailController,
                    streetController: _streetController,
                    cities: _cities,
                    districts: _districts,
                    selectedCity: _selectedCity,
                    selectedDistrict: _selectedDistrict,
                    onCityChanged: (value) =>
                        setState(() => _selectedCity = value),
                    onDistrictChanged: (value) =>
                        setState(() => _selectedDistrict = value),
                    countryCode: _countryCode,
                    onCountryChanged: (code) =>
                        setState(() => _countryCode = code),
                    onSave: _handleSave,
                    onCancel: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleImagePicker() {
    _showSnackBar('Image picker not implemented yet');
  }

  void _handleSave() {
    if (_fullNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _streetController.text.isEmpty ||
        _selectedCity == null ||
        _selectedDistrict == null) {
      _showSnackBar('Please fill all fields');
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile completed successfully!'),
        backgroundColor: kpimaryColor,
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
