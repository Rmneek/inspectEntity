import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/auth_user_enum.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/auth_flow_provider.dart';
import 'package:provider/provider.dart';

class OnBoardingViewModel extends BaseViewModel {
  bool? _isClient;

  bool? get isClient => _isClient;
  bool get showActions => _isClient != null;

  void selectUser(bool isClient) {
    if (_isClient == isClient) return;
    _isClient = isClient;
    notifyListeners();
  }

  void createAccount(BuildContext context) {
    final authFlow = context.read<AuthFlowProvider>();

    if (_isClient == true) {
      authFlow.setClient();
      context.replaceRoute(ClientSignUpStep1Route(showBackButton: false));
    } else {
      authFlow.setInspector();
      context.replaceRoute(InspectorSignUpRoute(showBackButton: false));
    }
  }

  Alignment get videoAlignment {
    if (_isClient == true) return Alignment.centerLeft;
    if (_isClient == false) return Alignment.centerRight;
    return Alignment.center;
  }

  String get headline {
    if (_isClient == true) {
      return onBoardingBullet1;
    } else if (_isClient == false) {
      return onBoardingBullet2;
    }
    return onBoardingBullet3;
  }

  void login(BuildContext context) {
    final authFlow = context.read<AuthFlowProvider>();

    if (_isClient == true) {
      authFlow.setClient();
    } else {
      authFlow.setInspector();
    }

    context.replaceRoute(ClientSignInRoute(showBackButton: false));
  }
}
