import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/di/app_component/app_component.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/view/onboarding_screen.dart';
import 'package:inspect_connect/features/onboarding_flow/view_model/onboarding_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OnBoardingView extends StatelessWidget implements AutoRouteWrapper {
  const OnBoardingView({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<OnBoardingViewModel>(),
      // ..init(),
      child: const OnBoardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) => const OnBoardingScreen();
}
