import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/di/app_component/app_component.dart';
import 'package:inspect_connect/features/splash_flow/presentation/widgets/splash_screen.dart';
import 'package:inspect_connect/features/splash_flow/view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashView extends StatelessWidget implements AutoRouteWrapper {
  const SplashView({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<SplashViewModel>(),
      child: const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) => const SplashScreen();
}
