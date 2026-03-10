import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_mobile.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_dropdown.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';

class ProfileFormSection extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController mobileController;
  final TextEditingController emailController;
  final TextEditingController streetController;
  final List<String> cities;
  final List<String> districts;
  final String? selectedCity;
  final String? selectedDistrict;
  final ValueChanged<String?> onCityChanged;
  final ValueChanged<String?> onDistrictChanged;
  final CountryCode countryCode;
  final ValueChanged<CountryCode> onCountryChanged;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const ProfileFormSection({
    super.key,
    required this.fullNameController,
    required this.mobileController,
    required this.emailController,
    required this.streetController,
    required this.cities,
    required this.districts,
    required this.selectedCity,
    required this.selectedDistrict,
    required this.onCityChanged,
    required this.onDistrictChanged,
    required this.countryCode,
    required this.onCountryChanged,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        const SizedBox(height: 15),
        CustomMobileField(
          controller: mobileController,
          initialCountry: countryCode,
          onCountryChanged: onCountryChanged,
        ),
        const SizedBox(height: 15),

        


        // const SizedBox(height: 15),

        // CustomTextField(controller: streetController, text: 'Street'),
        
        const SizedBox(height: 15),
        CustomDropdownField(
          hint: "City",
          items: cities,
          value: selectedCity,
          onChanged: onCityChanged,
        ),
        const SizedBox(height: 15),
        CustomDropdownField(
          hint: "District",
          items: districts,
          value: selectedDistrict,
          onChanged: onDistrictChanged,
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Cancel',
                type: ButtonType.primary,
                onPressed: onCancel,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'Save',
                type: ButtonType.primary,
                onPressed: onSave,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
