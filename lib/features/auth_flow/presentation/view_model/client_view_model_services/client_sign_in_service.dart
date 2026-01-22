import 'package:flutter/material.dart';
import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_state.dart';
import 'package:inspect_connect/core/di/app_component/app_component.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/core/utils/helpers/device_helper/device_info_helper.dart';
import 'package:inspect_connect/core/utils/toast_service/toast_service.dart';
import 'package:inspect_connect/features/auth_flow/domain/entities/auth_user_entity.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/sign_in_params.dart';
import 'package:inspect_connect/features/auth_flow/domain/usecases/sign_in_usecase.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';

class ClientSignInService {
  final ClientViewModelProvider vm;
  ClientSignInService(this.vm);

  Future<void> signIn({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    vm.enableLoginAutoValidate();
    if (!(formKey.currentState?.validate() ?? false)) return;

    vm.setLoading(true);
    try {
      vm.deviceToken = await DeviceInfoHelper.getDeviceToken();
      vm.deviceType = await DeviceInfoHelper.getDeviceType();

      final useCase = locator<SignInUseCase>();
      final state =
          await vm.executeParamsUseCase<AuthUserEntity, SignInParams>(
        useCase: useCase,
        query: SignInParams(
          email: cltEmailCtrl.text.trim(),
          password: cltPasswordCtrl.text.trim(),
          deviceToken: vm.deviceToken,
          deviceType: vm.deviceType,
        ),
        launchLoader: true,
      );

      state?.when(
        data: (user) async {
          // await vm.fetchUserDetail(user: user, context: context);

          if (!context.mounted) return;

          if (user.role == 1) {
            // context.router.replaceAll([const ClientDashboardRoute()]);
          } else {
            // await vm.checkInspectorState(context);
          }
        },
        error: (e) {
          ToastService.error(e.message ?? signInFailed);
        },
      );
    } finally {
      vm.setLoading(false);
    }
  }
}
