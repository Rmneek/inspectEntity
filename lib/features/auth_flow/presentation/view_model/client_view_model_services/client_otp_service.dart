import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/constants/app_text_editing_controllers.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';

class ClientOtpService {
  final ClientViewModelProvider vm;
  ClientOtpService(this.vm);

  Future<void> verify(BuildContext context) async {
    if (!vm.canVerify) return;

    vm.setLoading(true);
    try {
      // final user = await locator<AuthLocalDataSource>().getUser();
      // if (user == null) throw Exception(userNotFoundInLocal);

      // final useCase = locator<OtpVerificarionUseCase>();
      // final state =
      //     await vm.executeParamsUseCase<AuthUser, OtpVerificationParams>(
      //   useCase: useCase,
      //   query: OtpVerificationParams(
      //     phoneNumber: user.phoneNumber!,
      //     countryCode: user.countryCode!,
      //     phoneOtp: pinController.text,
      //   ),
      //   launchLoader: true,
      // );

      // state?.when(
      //   data: (u) async {
      //     await vm.fetchUserDetail(user: u, context: context);

      //     if (!context.mounted) return;

      //     context.router.replaceAll([
      //       u.role == 1
      //           ? const ClientDashboardRoute()
      //           : const InspectorDashboardRoute(),
      //     ]);
      //   },
      //   error: (e) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: textWidget(text: e.message ?? 'OTP failed')),
      //     );
      //   },
      // );
    } finally {
      vm.setLoading(false);
    }
  }

  Future<void> resend(BuildContext context) async {
    if (!vm.canResend) return;

    // final user = await locator<AuthLocalDataSource>().getUser();
    // if (user == null) return;

    // final useCase = locator<ResendOtpUseCase>();
    // await vm.executeParamsUseCase<AuthUser, ResendOtpParams>(
    //   useCase: useCase,
    //   query: ResendOtpParams(
    //     phoneNumber: user.phoneNumber!,
    //     countryCode: user.countryCode!,
    //   ),
    // );

    vm.startCooldown();
    pinController.clear();
  }
}
