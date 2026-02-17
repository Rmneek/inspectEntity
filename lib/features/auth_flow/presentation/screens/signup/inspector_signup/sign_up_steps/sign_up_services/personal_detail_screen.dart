import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_input_fields.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/core/utils/helpers/app_validators/app_validation.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/common_phone_field.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/inspector_widgets/section_tile_widget.dart';

class PersonalDetailsScreen extends StatelessWidget {
  final InspectorViewModelProvider vm;
  final GlobalKey<FormState> formKey;
  const PersonalDetailsScreen(this.vm, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(personalDetails),
        const SizedBox(height: 8),
        AppInputField(
          label: fullNameLabel,
          hint: fullNameLabel,
          controller: inspFullNameCtrl,
          validator: AppValidators.required,
          onChanged: (_) {
            if (vm.autoValidate) formKey.currentState?.validate();
          },
        ),
        const SizedBox(height: 10),
        textWidget(text: phoneNumberLabel, fontWeight: FontWeight.w400),
        const SizedBox(height: 8),

        CommonPhoneField(
          controller: inspPhoneCtrl,
          label: phoneNumberLabel,
          autoValidate: vm.autoValidate,
          formKey: formKey,
          validator: AppValidators.phone,
          onCountryChanged: ({required dial, required iso}) {
            cltCountryCodeCtrl.text = dial;
          },
        ),

        const SizedBox(height: 10),
        AppInputField(
          label: emailLabel,
          hint: emailHint,
          controller: inspEmailCtrlSignUp,
          keyboardType: TextInputType.emailAddress,
          validator: AppValidators.email,
          onChanged: (_) {
            if (vm.autoValidate) formKey.currentState?.validate();
          },
        ),
        const SizedBox(height: 10),
        AppPasswordField(
          label: passwordLabel,
          controller: inspPasswordCtrlSignUp,
          obscure: vm.obscurePassword,
          onToggle: vm.toggleObscurePassword,
          validator: AppValidators.password,
          onChanged: (_) {
            if (vm.autoValidate) formKey.currentState?.validate();
          },
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
