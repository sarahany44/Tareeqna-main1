import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_country_piker.dart';

class CustomMobileField extends StatefulWidget {
  final TextEditingController controller;
  final Function(CountryCode)? onCountryChanged;
  final CountryCode? initialCountry;

  const CustomMobileField({
    super.key,
    required this.controller,
    this.onCountryChanged,
    this.initialCountry,
  });

  @override
  State<CustomMobileField> createState() => _CustomMobileFieldState();
}

class _CustomMobileFieldState extends State<CustomMobileField> {
  late CountryCode _selectedCountryCode;

  @override
  void initState() {
    super.initState();
    _selectedCountryCode =
        widget.initialCountry ?? CountryCode.fromCountryCode('EG');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Your mobile number',
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            CustomCountryPicker(
              initialCountry: _selectedCountryCode,
              onChanged: (country) {
                setState(() => _selectedCountryCode = country);
                widget.onCountryChanged?.call(country);
              },
            ),
            const SizedBox(width: 6),
            Text(
              _selectedCountryCode.dialCode ?? '',
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
            const SizedBox(width: 6),
          ],
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF1ABC9C), width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
