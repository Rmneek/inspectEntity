import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_button.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';

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
          buttonBackgroundColor: AppColors.authThemeLightColor,
          text: createAccount,
          onTap: onCreate,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget(text: alreadyHaveAccTxt, color: AppColors.whiteColor),
            GestureDetector(
              onTap: onLogin,
              child: textWidget(
                text: loginTxt,
                color: AppColors.whiteColor,
                textDecorationColor: AppColors.whiteColor,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
