import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/auth_flow/domain/enums/auth_user_enum.dart';

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
    if (_isClient == null) return;

    final flow = _isClient! ? AuthUserType.client : AuthUserType.inspector;

    // store flow if needed later
  }
  // AuthUserType? _currentFlow;

  // AuthUserType? get currentFlow => _currentFlow;

  // void setUserType(AuthUserType flow) {
  //   _currentFlow = flow;
  //   notifyListeners();
  // }

  // bool get isClient => _currentFlow == AuthUserType.client;
  // bool get isInspector => _currentFlow == AuthUserType.inspector;
  // bool? _isClient;
  // bool get showActions => _isClient != null;

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

  // void selectUser(bool isClient) {
  //   if (_isClient == isClient) return;
  //   _isClient = isClient;
  //   notifyListeners();
  // }

  // void createAccount(BuildContext context) {
  //   if (_isClient == null) return;

  //   setUserType(_isClient! ? AuthUserType.client : AuthUserType.inspector);

  //   // context.replaceRoute(
  //   // _isClient!
  //   //     ? ClientSignUpRoute(showBackButton: false)
  //   //     : InspectorSignUpRoute(showBackButton: false),
  //   // );
  // }

  void login(BuildContext context) {
    // if (_isClient == null) return;

    // // authFlowProvider.setUserType(
    // //   _isClient! ? AuthUserType.client : AuthUserType.inspector,
    // // );

    // context.replaceRoute(
    //   ClientSignInRoute(showBackButton: false),
    // );
  }
}
