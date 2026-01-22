import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';

class ClientForgotPasswordService {
  final ClientViewModelProvider vm;
  ClientForgotPasswordService(this.vm);

  Future<void> requestReset({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    vm.enableForgotAutoValidate();
    if (!(formKey.currentState?.validate() ?? false)) return;

    vm.setLoading(true);
    try {
      // vm.startOtpFlow(OtpPurpose.forgotPassword);
      context.pushRoute(OtpVerificationRoute(addShowButton: true));
    } finally {
      vm.setLoading(false);
    }
  }
}
