import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';

class SplashViewModel extends BaseViewModel {
  // final AuthLocalDataSource _authLocalDataSource;
  // final UserProvider _userProvider;
  // final BookingProvider _bookingProvider;
  // final InspectorDashboardProvider _inspectorProvider;

  // SplashViewModel(
  //   // this._authLocalDataSource,
  //   // this._userProvider,
  //   // this._bookingProvider,
  //   // this._inspectorProvider,
  // );

  Future<void> start(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 300));

    // final user = await _authLocalDataSource.getUser();

    // if (user != null) {
    //   _userProvider.setUser(user);
    //   await _userProvider.loadUser();
    // }

    // if (!_userProvider.isLoggedIn) {
    //   _navigate(context, const OnBoardingRoute());
    //   return;
    // }

    // if (_userProvider.isUserClient) {
    //   await _bookingProvider.fetchBookingsList();
    //   _navigate(context, const ClientDashboardRoute());
    //   return;
    // }

    // if (_userProvider.isUserInspector) {
    //   await _handleInspector(context);
    //   return;
    // }

    navigate(context, const OnBoardingRoute());
  }

  Future<void> handleInspector(BuildContext context) async {
    // await _inspectorProvider.initializeUserState();
    // _navigate(context, const InspectorDashboardRoute());
  }

  void navigate(BuildContext context, PageRouteInfo route) {
    if (!context.mounted) return;
    context.router.replace(route);
  }

  @override
  void onDispose() {}
}
