import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/forgot_password_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/otp_verification_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/sign_in_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/client_signup/client_sign_up_step_1_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/client_signup/client_sign_up_step_2_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/inspector_signup/inspector_sign_up_screen.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/view/onboarding_view.dart';
import 'package:inspect_connect/features/splash_flow/presentation/view/splash_view.dart';

part 'auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnBoardingRoute.page),
    AutoRoute(page: ClientSignUpStep2Route.page),
    AutoRoute(page: ClientSignUpStep1Route.page),
    AutoRoute(page: ForgotpPasswordRoute.page),
    AutoRoute(page: OtpVerificationRoute.page),
    AutoRoute(page: ClientSignInRoute.page),
    AutoRoute(page: InspectorSignUpRoute.page),


  ];
}
