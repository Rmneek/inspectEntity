import 'package:inspect_connect/core/di/app_component/app_component.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:inspect_connect/features/onboarding_flow/view_model/onboarding_view_model.dart';
import 'package:inspect_connect/features/splash_flow/view_model/splash_view_model.dart';

final GetIt locator = GetIt.I;

@InjectableInit(preferRelativeImports: false)
Future<void> initAppComponentLocator() async => locator.init();

void setupLocator() {
  locator.registerFactory<SplashViewModel>(
    () => SplashViewModel(
      // locator<AuthLocalDataSource>(),
      // locator<UserProvider>(),
      // locator<BookingProvider>(),
      // locator<InspectorDashboardProvider>(),
    ),
  );
  locator.registerFactory<OnBoardingViewModel>(
    () => OnBoardingViewModel(
      // locator<AuthFlowProvider>(),
    ),
  );
}
