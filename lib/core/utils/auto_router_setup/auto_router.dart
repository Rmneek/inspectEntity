import 'package:auto_route/auto_route.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/view/onboarding_view.dart';
import 'package:inspect_connect/features/splash_flow/presentation/view/splash_view.dart';

part 'auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnBoardingRoute.page),
  ];
}
