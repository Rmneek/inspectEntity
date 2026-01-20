import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel {
  // final AuthFlowProvider _authFlowProvider;

  OnBoardingViewModel(
    // this._authFlowProvider
  );
  bool? _isClient;
  bool get showActions => _isClient != null;
  final PageController pageController = PageController(initialPage: 0);

  int _currentPage = 0;
  int get currentPage => _currentPage;

  Timer? _timer;

  bool? get isClient => _isClient;

  bool _showAuthOptions = false;
  bool get showAuthOptions => _showAuthOptions;
  Alignment get videoAlignment {
    if (_isClient == true) return Alignment.centerLeft;
    if (_isClient == false) return Alignment.centerRight;
    return Alignment.center;
  }

  void init() {
    _startAutoSlide();
  }

  void selectUser(bool isClient) {
    if (_isClient == isClient) return;
    _isClient = isClient;
    notifyListeners();
  }

  void createAccount(BuildContext context) {
    if (_isClient == null) return;

    // _authFlowProvider.setUserType(
    //   _isClient! ? AuthUserType.client : AuthUserType.inspector,
    // );

    // context.replaceRoute(
    //   _isClient!
    //       ? ClientSignUpRoute(showBackButton: false)
    //       : InspectorSignUpRoute(showBackButton: false),
    // );
  }

  void login(BuildContext context) {
    if (_isClient == null) return;

    // _authFlowProvider.setUserType(
    //   _isClient! ? AuthUserType.client : AuthUserType.inspector,
    // );

    // context.replaceRoute(
    //   ClientSignInRoute(showBackButton: false),
    // );
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _currentPage = (_currentPage + 1) % 3;

      if (pageController.hasClients) {
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
        );
      }
      notifyListeners();
    });
  }

  void onPageChanged(int page) {
    if (page >= 0 && page <= 2) {
      _currentPage = page;
      notifyListeners();
    }
  }

  // ─────────────── Toggle Client / Inspector ───────────────
  void selectUserType(bool isClient) {
    if (_isClient == isClient) return;

    _isClient = isClient;
    _showAuthOptions = true;
    notifyListeners();
  }

  // Alignment get videoAlignment {
  //   if (_isClient == true) return Alignment.centerLeft;
  //   if (_isClient == false) return Alignment.centerRight;
  //   return Alignment.center;
  // }

  String get headline {
    if (_isClient == true) {
      return "Connecting Quality Inspections\nwith Quality Projects\nfor Every Build that Matters";
    } else if (_isClient == false) {
      return "Join a Trusted Network\nof Inspectors Connecting\nyou with Quality Opportunities";
    }
    return "Welcome to Inspect Connect - \nWhere Projects and Inspectors\nMeet to Build Better Together";
  }

  // ─────────────── Navigation Logic ───────────────
  void proceedToSignup(BuildContext context) {
    if (_isClient == null) return;

    // _authFlowProvider.setUserType(
    //   _isClient! ? AuthUserType.client : AuthUserType.inspector,
    // );

    // context.replaceRoute(
    //   _isClient!
    //       ? ClientSignUpRoute(showBackButton: false)
    //       : InspectorSignUpRoute(showBackButton: false),
    // );
  }

  void proceedToLogin(BuildContext context) {
    if (_isClient == null) return;

    // _authFlowProvider.setUserType(
    //   _isClient! ? AuthUserType.client : AuthUserType.inspector,
    // );

    // context.replaceRoute(
    //   ClientSignInRoute(showBackButton: false),
    // );
  }

  @override
  void onDispose() {
    _timer?.cancel();
    pageController.dispose();
    super.onDispose();
  }
}
