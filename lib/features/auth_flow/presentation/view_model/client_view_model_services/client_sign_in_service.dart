import 'dart:developer';
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
  }) async {
    log('--tapped--service->. signIn');

    if (!(formKey.currentState?.validate() ?? false)) return;
    vm.enableLoginAutoValidate();

    vm.setSigningIn(true);
    try {
      final deviceToken = await DeviceInfoHelper.getDeviceToken();
      final deviceType = await DeviceInfoHelper.getDeviceType();

      final useCase = locator<SignInUseCase>();
      final params = SignInParams(
        email: cltEmailCtrl.text.trim(),
        password: cltPasswordCtrl.text.trim(),
        deviceToken: deviceToken,
        deviceType: deviceType,
      );
      final state = await vm.executeParamsUseCase<AuthUserEntity, SignInParams>(
        useCase: useCase,
        query: params,
        launchLoader: true,
      );

      state?.when(
        data: (user) async {
          // await vm.fetchUserDetail(user: user, context: context);


          if (user.role == 1) {
            log('---------> User got logged in ');
            // context.router.replaceAll([const ClientDashboardRoute()]);
          } else {
            // await vm.checkInspectorState(context);
          }
          cltEmailCtrl.clear();
          cltPasswordCtrl.clear();
        },
        error: (e) {
          ToastService.error(e.message ?? signInFailed);
        },
      );
    } finally {
      vm.setSigningIn(false);
    }
  }
}
