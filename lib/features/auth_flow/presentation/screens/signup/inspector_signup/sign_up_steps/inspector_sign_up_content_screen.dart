import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_responsive_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_card_container.dart';
import 'package:inspect_connect/core/utils/constants/app_asset_constants.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/inspector_signup/sign_up_steps/sign_up_services/additional_detail_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/inspector_signup/sign_up_steps/sign_up_services/personal_detail_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/inspector_signup/sign_up_steps/sign_up_services/professional_detail_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/inspector_signup/sign_up_steps/sign_up_services/service_area_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/inspector_common_auth_bar.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/sign_up_bottom_button_bar.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/stepper_header.dart';
import 'package:provider/provider.dart';

class InspectorSignUpContent extends StatefulWidget {
  final bool showBackButton;
  const InspectorSignUpContent({super.key, required this.showBackButton});

  @override
  State<InspectorSignUpContent> createState() => _InspectorSignUpContentState();
}

class _InspectorSignUpContentState extends State<InspectorSignUpContent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<InspectorViewModelProvider>().init();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<InspectorViewModelProvider>();
    final steps = [
      PersonalDetailsScreen(vm, vm.personalKey),
      ProfessionalDetailsScreen(vm, vm.professionalKey),
      ServiceAreaScreen(vm, vm.serviceAreaKey),
      AdditionalDetailScreen(vm, vm.additionalKey),
    ];

    return BaseResponsiveWidget(
      initializeConfig: true,
      buildWidget: (ctx, rc, app) => InspectorCommonAuthBar(
        title: signUpTitle,
        subtitle: signUpSubtitle,
        showBackButton: widget.showBackButton,
        image: finalImage,
        rc: rc,
        headerWidget: StepperHeader(
          current: vm.userCurrentStep.index,
          labels: const [
            personalDetailsLabel,
            professionalDetailsLabel,
            serviceAreaLabel,
            additionalDetailsLabel,
          ],
          // It can be uncommented if you want to allow users to navigate to specific steps by tapping on the step labels.
          // onTap: (i) {
          // if (i < SignupStep.values.length) vm.goToStep(i);
          // },
        ),
        bottomSection: SignupActionBar(
          vm: vm,
          onNext: () => vm.onNextPressed(context),
          
        ),
        form: Stack(
          children: [
            AbsorbPointer(
              absorbing: vm.isProcessing,
              child: Opacity(
                opacity: vm.isProcessing ? 0.6 : 1,
                child: Column(
                  children: [
                    AppCardContainer(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      child: Form(
                        key: vm.currentFormKey,
                        autovalidateMode: vm.autoValidate
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        child: SingleChildScrollView(
                          child: steps[vm.userCurrentStep.index],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            if (vm.isProcessing)
              const Positioned.fill(
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}
