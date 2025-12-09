import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CustomCountryPicker extends StatefulWidget {
  final Function(CountryCode)? onChanged;
  final CountryCode? initialCountry;
  final String? initialSelection;

  const CustomCountryPicker({
    super.key,
    this.onChanged,
    this.initialCountry,
    this.initialSelection,
  });

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  late CountryCode _selectedCountryCode;

  @override
  void initState() {
    super.initState();
    _selectedCountryCode =
        widget.initialCountry ?? CountryCode.fromCountryCode('BD');
  }

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: (country) {
        setState(() => _selectedCountryCode = country);
        if (widget.onChanged != null) {
          widget.onChanged!(country);
        }
      },
      initialSelection: widget.initialSelection ?? _selectedCountryCode.code,
      favorite: const ['+880', 'BD'],
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
      showFlag: true,
      showFlagDialog: true,
      hideMainText: true,
      showDropDownButton: false,
      flagWidth: 25,
      textStyle: const TextStyle(fontSize: 16, color: Colors.black87),
      padding: EdgeInsets.zero,
      dialogTextStyle: const TextStyle(fontSize: 16, color: Colors.black87),
      searchDecoration: const InputDecoration(
        hintText: 'Search country',
        border: OutlineInputBorder(),
      ),
      searchStyle: const TextStyle(fontSize: 16, color: Colors.black87),
    );
  }
}
