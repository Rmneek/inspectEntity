import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_button.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';

class OnBoardingActions extends StatelessWidget {
  final VoidCallback onCreate;
  final VoidCallback onLogin;

  const OnBoardingActions({
    required this.onCreate,
    required this.onLogin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          height: 40,
          buttonBackgroundColor: const Color(0xFF0070F2),
          text: "Create Account",
          onTap: onCreate,
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: onLogin,
          child: textWidget(
            text: "Login",
            color: Colors.white,
            textDecoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
