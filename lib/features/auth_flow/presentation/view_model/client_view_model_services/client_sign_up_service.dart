import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/commondomain/entities/based_api_result/api_result_state.dart';
import 'package:inspect_connect/core/di/app_component/app_component.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/core/utils/helpers/device_helper/device_info_helper.dart';
import 'package:inspect_connect/core/utils/toast_service/toast_service.dart';
import 'package:inspect_connect/features/auth_flow/domain/entities/auth_user_entity.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/sign_in_params.dart';
import 'package:inspect_connect/features/auth_flow/domain/usecases/sign_in_usecase.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';

class ClientSignUpService {
  final ClientViewModelProvider vm;
  ClientSignUpService(this.vm);

  Future<void> signUp({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    vm.enableSignupAutoValidate();
    if (!(formKey.currentState?.validate() ?? false)) return;

    vm.setLoading(true);
    try {
      vm.deviceToken = await DeviceInfoHelper.getDeviceToken();
      vm.deviceType = await DeviceInfoHelper.getDeviceType();

      final useCase = locator<SignInUseCase>();
      final params = SignInParams(
        // role: 1,
        email: cltEmailCtrlSignUp.text.trim(),
        // name: cltFullNameCtrl.text.trim(),
        // phoneNumber: cltPhoneCtrl.text.trim(),
        password: cltPasswordCtrlSignUp.text.trim(),
        deviceToken: vm.deviceToken,
        deviceType: vm.deviceType,
      );

      final state = await vm.executeParamsUseCase<AuthUserEntity, SignInParams>(
        useCase: useCase,
        query: params,
        launchLoader: true,
      );

      state?.when(
        data: (user) async {
          // await locator<AuthLocalDataSource>()
          //     .saveUser(user.toLocalEntity());

          // vm.startOtpFlow(OtpPurpose.signUp);
          context.pushRoute(OtpVerificationRoute(addShowButton: true));
        },
        error: (e) {
          ToastService.error(e.message ?? signupFailed);
        },
      );
    } finally {
      vm.setLoading(false);
    }
  }
}
