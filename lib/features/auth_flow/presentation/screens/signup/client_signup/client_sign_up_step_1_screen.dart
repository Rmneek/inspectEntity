import 'package:auto_route/auto_route.dart';
import 'package:inspect_connect/core/basecomponents/base_responsive_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_button.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_input_fields.dart';
import 'package:inspect_connect/core/utils/constants/app_asset_constants.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/core/utils/helpers/app_validators/app_validation.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/auth_targer_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/auth_form_switch_row.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/common_auth_bar.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/common_phone_field.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ClientSignUpStep1View extends StatelessWidget {
  final bool showBackButton;
  const ClientSignUpStep1View({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BaseResponsiveWidget(
      initializeConfig: true,
      buildWidget: (ctx, rc, app) {
        final vm = ctx.watch<ClientViewModelProvider>();

        return CommonAuthBar(
          title: signUpTitle,
          showBackButton: showBackButton,
          subtitle: signUpSubtitle,
          image: finalImage,
          rc: rc,
          form: Form(
            key: formKey,
            autovalidateMode: vm.signup1AutoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppInputField(
                  label: fullNameLabel,
                  hint: fullNameLabel,
                  controller: cltFullNameCtrl,
                  validator: vm.validateRequired,
                  onChanged: (_) {
                    if (vm.signup1AutoValidate) {
                      formKey.currentState?.validate();
                    }
                  },
                ),
                const SizedBox(height: 14),

                textWidget(text: phoneNumberLabel, fontWeight: FontWeight.w400),

                const SizedBox(height: 8),

                CommonPhoneField(
                  controller: cltPhoneCtrl,
                  label: phoneNumberLabel,
                  autoValidate: vm.signup1AutoValidate,
                  formKey: formKey,
                  validator: AppValidators.phone,
                  onCountryChanged: ({required dial, required iso}) {
                    cltCountryCodeCtrl.text = dial;
                  },
                ),

                const SizedBox(height: 14),
                AppInputField(
                  label: emailLabel,
                  hint: emailHint,
                  controller: cltEmailCtrlSignUp,
                  keyboardType: TextInputType.emailAddress,
                  validator: vm.validateEmail,
                  onChanged: (_) {
                    if (vm.signup1AutoValidate) {
                      formKey.currentState?.validate();
                    }
                  },
                ),
                const SizedBox(height: 28),
                AppButton(
                  buttonBackgroundColor: AppColors.authThemeColor,
                  borderColor: AppColors.authThemeColor,
                  onTap: () async {
                    vm.submitStep1(formKey: formKey, );
                  },
                  text: continueTxt,
                ),

                AuthFormSwitchRow(
                  question: alreadyHaveAccTxt,
                  actionText: signInTitle,
                  onTap: () => vm.switchAuth(
                    target: AuthTarget.signIn,
                  ),
                  actionColor: AppColors.authThemeLightColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
