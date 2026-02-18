import 'package:auto_route/auto_route.dart';
import 'package:inspect_connect/core/basecomponents/base_responsive_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_button.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_input_fields.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/constants/app_asset_constants.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/auth_targer_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/auth_form_switch_row.dart';
import 'package:inspect_connect/features/auth_flow/presentation/widgets/common_auth_bar.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ClientSignInView extends StatelessWidget {
  final bool showBackButton;
  const ClientSignInView({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final provider = context.watch<ClientViewModelProvider>();

    return BaseResponsiveWidget(
      initializeConfig: true,
      buildWidget: (ctx, rc, app) {
        return CommonAuthBar(
          title: signInTitle,
          subtitle: welcomeBack,
          showBackButton: showBackButton,
          image: finalImage,
          rc: rc,
          form: Form(
            key: formKey,
            autovalidateMode: provider.loginAutoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppInputField(
                  label: emailLabel,
                  controller: cltEmailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  hint: emailHint,
                  validator: provider.validateEmail,
                  onChanged: (_) {
                    if (provider.loginAutoValidate) {
                      formKey.currentState?.validate();
                    }
                  },
                ),
                const SizedBox(height: 14),
                AppPasswordField(
                  label: passwordLabel,
                  controller: cltPasswordCtrl,
                  obscure: provider.obscure,
                  onToggle: provider.toggleObscure,
                  validator: provider.validateRequired,
                  onChanged: (_) {
                    if (provider.loginAutoValidate) {
                      formKey.currentState?.validate();
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.pushRoute(
                        ForgotpPasswordRoute(showBackButton: true),
                      );
                      provider.clearAuthControllers();
                    },
                    child: textWidget(
                      text: forgotPassword,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.authThemeLightColor,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                AppButton(
                  text: provider.isSigningIn ? signingIn : signInTitle,
                  buttonBackgroundColor: AppColors.authThemeColor,
                  borderColor: AppColors.authThemeColor,
                  isLoading: provider.isSigningIn,
                  isElevation: true,
                  isDisabled: provider.isSigningIn,
                  onTap: () => provider.signIn(formKey: formKey),
                ),
                AuthFormSwitchRow(
                  question: dontHaveAccount,
                  actionText: signUpTitle,
                  onTap: () => provider.switchAuth(target: AuthTarget.signUp),
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
