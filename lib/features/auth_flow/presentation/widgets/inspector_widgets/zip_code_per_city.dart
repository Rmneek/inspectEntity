import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_input_fields.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';

class ZipCodeFieldPerCity extends StatelessWidget {
  final String city;
  final TextEditingController controller;
  final Function(String?) onChanged;

  const ZipCodeFieldPerCity({
    super.key,
    required this.city,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppInputField(
      label: "$zipCodeFor $city",
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
