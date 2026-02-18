import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/navigation_service.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/auth_flow_provider.dart';

class OnBoardingViewModel extends BaseViewModel {
  final NavigationService _navService;
  final AuthFlowViewModel _authFlow;

  OnBoardingViewModel(this._navService, this._authFlow);
  bool? _isClient;

  bool? get isClient => _isClient;
  bool get showActions => _isClient != null;

  void selectUser(bool isClient) {
    if (_isClient == isClient) return;
    _isClient = isClient;
    notifyListeners();
  }

  void createAccount() {
    if (_isClient == true) {
      _authFlow.setClient();
      _navService.replaceRoute(ClientSignUpStep1Route(showBackButton: false));
    } else {
      _authFlow.setInspector();
      _navService.replaceRoute(InspectorSignUpRoute(showBackButton: false));
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

  void login() {
    if (_isClient == true) {
      _authFlow.setClient();
    } else {
      _authFlow.setInspector();
    }

    _navService.replaceRoute(ClientSignInRoute(showBackButton: false));
  }
}
