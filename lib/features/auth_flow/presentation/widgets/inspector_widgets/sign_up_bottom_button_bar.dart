import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_button.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';

class SignupActionBar extends StatelessWidget {
  final InspectorViewModelProvider vm;
  final VoidCallback? onNext;

  const SignupActionBar({super.key, required this.vm, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final isSubmitDisabled = vm.userCurrentStep.index == 3;
    // &&
    // (!vm.agreedToTerms || !vm.confirmTruth);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              isBorder: true,
              buttonBackgroundColor: Colors.white,
              borderColor: Colors.grey,
              textColor: AppColors.authThemeColor,
              onTap: vm.userCurrentStep.index == 0 ? null : vm.goToPrevious,
              text: previousTxt,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AppButton(
              buttonBackgroundColor: isSubmitDisabled
                  ? Colors.grey
                  : AppColors.authThemeColor,
              onTap: isSubmitDisabled ? null : onNext,
              text: vm.userCurrentStep.index < 3 ? nextTxt : submitTxt,
            ),
          ),
        ],
      ),
    );
  }
}
