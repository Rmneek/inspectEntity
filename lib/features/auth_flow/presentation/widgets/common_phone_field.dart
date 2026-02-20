import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_text_style.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CommonPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final Function({required String iso, required String dial})? onCountryChanged;
  final bool autoValidate;
  final GlobalKey<FormState>? formKey;
  const CommonPhoneField({
    super.key,
    required this.controller,
    required this.label,
    this.onCountryChanged,
    this.validator,
    this.autoValidate = false,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: controller.text.isNotEmpty ? controller.text : null,
      validator: (value) => validator?.call(value),
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntlPhoneField(
              controller: controller,
              style: appTextStyle(fontSize: 12),
              initialCountryCode: 'IN',
              disableLengthCheck: true,
              showDropdownIcon: true,
              flagsButtonPadding: const EdgeInsets.only(left: 8),
              dropdownIconPosition: IconPosition.trailing,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                hintText: label,
                counterText: '',
                hintStyle: appTextStyle(fontSize: 12, color: Colors.grey),
                errorText: state.errorText,
                errorStyle: appTextStyle(fontSize: 12, color: Colors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.authThemeColor,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (phone) {
                state.didChange(phone.completeNumber);
                if (autoValidate) {
                  formKey?.currentState?.validate();
                }
              },
              onCountryChanged: (country) {
                onCountryChanged?.call(
                  iso: country.code,
                  dial: '+${country.dialCode}',
                );
                if (autoValidate) {
                  formKey?.currentState?.validate();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
