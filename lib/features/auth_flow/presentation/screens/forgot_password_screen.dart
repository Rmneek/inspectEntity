import 'package:auto_route/auto_route.dart';
import 'package:inspect_connect/core/basecomponents/base_responsive_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_button.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_input_fields.dart';
import 'package:inspect_connect/core/utils/constants/app_asset_constants.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/auth_form_switch_row.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/common_auth_bar.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ForgotpPasswordView extends StatelessWidget {
  final bool showBackButton;
  const ForgotpPasswordView({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BaseResponsiveWidget(
      initializeConfig: true,
      buildWidget: (ctx, rc, app) {
        final provider = ctx.watch<ClientViewModelProvider>();

        return CommonAuthBar(
          title: forgotPassword,
          showBackButton: showBackButton,
          subtitle: forgotPasswordSubtitle,
          image: finalImage,
          rc: rc,
          form: Form(
            key: formKey,
            autovalidateMode: provider.forgotAutoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppInputField(
                  label: emailLabel,
                  hint: emailHint,
                  controller: cltResetEmailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => provider.validateEmail(v),
                  onChanged: (_) {
                    if (provider.forgotAutoValidate) {
                      formKey.currentState?.validate();
                    }
                  },
                ),

                const SizedBox(height: 28),

                AppButton(
                  buttonBackgroundColor: AppColors.authThemeColor,
                  borderColor: AppColors.authThemeColor,
                  text: provider.isSigningIn
                      ? sendingText
                      : sendVerificationCode,
                  onTap: () async {
                    final isValid = formKey.currentState?.validate() ?? false;
                    if (!isValid) {
                      provider.enableForgotAutoValidate();
                      return;
                    }
                    if (!provider.isSigningIn) {
                      await provider.requestPasswordReset(
                        formKey: formKey,
                        context: context,
                      );
                    }
                  },
                ),

                AuthFormSwitchRow(
                  question: rememberPasswordText,
                  actionText: signInTitle,
                  onTap: () {
                    context.router.pop();
                    provider.clearAuthControllers();
                  },
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
