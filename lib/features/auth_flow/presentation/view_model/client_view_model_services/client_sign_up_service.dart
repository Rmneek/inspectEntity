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
import 'package:inspect_connect/features/auth_flow/domain/entities/geo_location_entity.dart';
import 'package:inspect_connect/features/auth_flow/domain/params/client_sign_up_params.dart';
import 'package:inspect_connect/features/auth_flow/domain/usecases/client_sign_up_usecase.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';

class ClientSignUpService {
  final ClientViewModelProvider vm;
  ClientSignUpService(this.vm);

  Future<void> signUp({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    vm.enableSignup1AutoValidate();
    if (!(formKey.currentState?.validate() ?? false)) return;

    vm.setSigningIn(true);
    try {
      final deviceToken = await DeviceInfoHelper.getDeviceToken();
      final deviceType = await DeviceInfoHelper.getDeviceType();

      final useCase = locator<ClientSignUpUsecase>();
      final params = ClientSignUpParams(
        role: 1,
        email: cltEmailCtrlSignUp.text.trim(),
        name: cltFullNameCtrl.text.trim(),
        phoneNumber: cltPhoneCtrl.text.trim().toString(),
        countryCode: cltCountryCodeCtrl.text.trim().toString() != ""
            ? cltCountryCodeCtrl.text.trim().toString()
            : "+91",
        password: cltPasswordCtrlSignUp.text.trim(),
        deviceToken: deviceToken,
        deviceType: deviceType,
        mailingAddress: cltAddressCtrl.text.toString(),
        zip: 'pincode.toString()',
        agreedToTerms: true,
        isTruthfully: true,
        location: GeoLocationEntity(
          locationName: 'locationName',
          latitude: 0,
          longitude: 0,
        ),
      );
      final state = await vm
          .executeParamsUseCase<AuthUserEntity, ClientSignUpParams>(
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
      vm.setSigningIn(false);
    }
  }
}
