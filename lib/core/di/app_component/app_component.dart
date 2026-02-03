import 'package:inspect_connect/core/di/app_component/app_component.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:inspect_connect/features/auth_flow/data/datasources/remote_datasources/auth_remote_data_source.dart';
import 'package:inspect_connect/features/auth_flow/data/repositories/auth_repository_impl.dart';
import 'package:inspect_connect/features/auth_flow/domain/repositories/auth_repository.dart';
import 'package:inspect_connect/features/auth_flow/domain/usecases/client_sign_up_usecase.dart';
import 'package:inspect_connect/features/auth_flow/domain/usecases/sign_in_usecase.dart';
import 'package:inspect_connect/features/onboarding_flow/view_model/onboarding_view_model.dart';
import 'package:inspect_connect/features/splash_flow/view_model/splash_view_model.dart';

final GetIt locator = GetIt.I;

@InjectableInit(preferRelativeImports: false)
Future<void> initAppComponentLocator() async => locator.init();

void setupLocator() {
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator()),
  );
  // locator.registerLazySingleton<ClientUserRepository>(
  //   () => ClientUserRepositoryImpl(locator()),
  // );

  // locator.registerLazySingleton<BookingRemoteDataSource>(
  //   () => BookingRemoteDataSourceImpl(locator()),
  // );

  // locator.registerLazySingleton<InspectorRemoteDataSource>(
  //   () => InspectorRemoteDataSourceImpl(locator()),
  // );

  // locator.registerLazySingleton<InspectorRepository>(
  //   () => InspectorRepositoryImpl(locator()),
  // );
  locator.registerFactory<SplashViewModel>(
    () => SplashViewModel(
      // locator<InspectorDashboardProvider>(),
    ),
  );
  locator.registerFactory<OnBoardingViewModel>(
    () => OnBoardingViewModel(
      // locator<AuthFlowProvider>(),
    ),
  );
  locator.registerLazySingleton(() => SignInUseCase(locator()));
  locator.registerLazySingleton(() => ClientSignUpUsecase(locator()));
}
