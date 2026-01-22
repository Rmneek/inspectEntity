import 'package:auto_route/auto_route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inspect_connect/core/basecomponents/base_responsive_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/address_auto_complete_field_widget.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_button.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_input_fields.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
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
class ClientSignUpStep2View extends StatelessWidget {
  final bool showBackButton;
  const ClientSignUpStep2View({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BaseResponsiveWidget(
      initializeConfig: true,
      buildWidget: (ctx, rc, app) {
        final vm = ctx.watch<ClientViewModelProvider>();

        return CommonAuthBar(
          title: createAccount,
          subtitle: enterPasswordAndAddressDetailToContinue,
          showBackButton: showBackButton,
          image: finalImage,
          rc: rc,
          form: Form(
            key: formKey,
            autovalidateMode: vm.autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppPasswordField(
                  label: newPasswordLabel,
                  controller: cltPasswordCtrlSignUp,
                  obscure: vm.obscurePassword,
                  onToggle: vm.togglePassword,
                  validator: vm.validatePassword,
                ),

                const SizedBox(height: 14),

                AppPasswordField(
                  label: confirmNewPasswordLabel,
                  controller: cltConfirmPasswordCtrl,
                  obscure: vm.obscureConfirm,
                  onToggle: vm.toggleConfirm,
                  validator: vm.validateConfirmPassword,
                ),

                const SizedBox(height: 14),

                AddressAutocompleteField(
                  label: addressLabel,
                  controller: cltAddressCtrl,
                  googleApiKey: dotenv.env['GOOGLE_API_KEY']!,
                  validator: vm.validateMailingAddress,
                  onFullAddressFetched: vm.setAddressData,
                ),

                const SizedBox(height: 28),

                AppButton(
                  text: submitTxt,
                  buttonBackgroundColor: AppColors.authThemeColor,
                  borderColor: AppColors.authThemeColor,
                  isLoading: vm.isSigningIn,
                  isDisabled: vm.isSigningIn,
                  onTap: () {
                    vm.submitStep2(formKey: formKey, context: context);
                  },
                ),

                AuthFormSwitchRow(
                  question: alreadyHaveAccount,
                  actionText: signInTitle,
                  actionColor: AppColors.authThemeLightColor,
                  onTap: () {
                    context.router.replaceAll([
                      ClientSignInRoute(showBackButton: false),
                    ]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
