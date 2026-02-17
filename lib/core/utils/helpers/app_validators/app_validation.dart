import 'package:inspect_connect/core/utils/constants/app_strings.dart';

class AppValidators {
  static String? required(String? v) {
    if (v == null || v.trim().isEmpty) return requiredTxt;
    return null;
  }

  static String? email(String? v) {
    if (v == null || v.trim().isEmpty) return emailRequired;

    final regex = RegExp(emailRegexExpression);

    return regex.hasMatch(v.trim()) ? null : invalidEmail;
  }

  static String? phone(String? v) {
    if (v == null || v.trim().isEmpty) return phoneRequiredError;
    if (v.trim().length < 10) return phoneInvalidError;
    return null;
  }

  static String? password(String? v) {
    final regex = RegExp(passwordRegexExpression);

    if (v == null || v.isEmpty) return passwordRequired;
    if (!regex.hasMatch(v)) return invalidPassword;
    return null;
  }

  static String? confirmPassword({
    required String? value,
    required String original,
  }) {
    if (value == null || value.isEmpty) return confirmYourPassword;
    if (value != original) return passwordMismatchError;
    return null;
  }
  
}