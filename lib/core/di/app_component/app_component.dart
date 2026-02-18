import 'package:inspect_connect/core/di/app_component/app_component.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/navigation_service.dart';
import 'package:inspect_connect/features/auth_flow/data/datasources/remote_datasources/auth_remote_data_source.dart';
import 'package:inspect_connect/features/auth_flow/data/repositories/auth_repository_impl.dart';
import 'package:inspect_connect/features/auth_flow/domain/repositories/auth_repository.dart';
import 'package:inspect_connect/features/auth_flow/domain/usecases/client_sign_up_usecase.dart';
import 'package:inspect_connect/features/auth_flow/domain/usecases/sign_in_usecase.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/auth_flow_provider.dart';
import 'package:inspect_connect/features/common_features/data/datasources/remote_datasources/common_remote_data_source.dart';
import 'package:inspect_connect/features/common_features/data/repositories/common_repositoy_impl.dart';
import 'package:inspect_connect/features/common_features/domain/repositories/common_repository.dart';
import 'package:inspect_connect/features/common_features/domain/usecases/certificate_type_usecase.dart';
import 'package:inspect_connect/features/common_features/domain/usecases/upload_image_usecase.dart';
import 'package:inspect_connect/features/common_features/view_model/common_view_model.dart';
import 'package:inspect_connect/features/onboarding_flow/view_model/onboarding_view_model.dart';
import 'package:inspect_connect/features/splash_flow/view_model/splash_view_model.dart';

final GetIt locator = GetIt.I;

@InjectableInit(preferRelativeImports: false)
Future<void> initAppComponentLocator() async => locator.init();

void setupLocator() {
  locator.registerSingleton<AppRouter>(AppRouter());
  locator.registerSingleton<NavigationService>(
    NavigationService(locator<AppRouter>()),
  );
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator()),
  );

  locator.registerLazySingleton<CommonRepository>(
    () => CommonRepositoryImpl(locator()),
  );

  locator.registerLazySingleton<CommonRemoteDataSource>(
    () => CommonRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton(() => SignInUseCase(locator()));
  locator.registerLazySingleton(() => ClientSignUpUsecase(locator()));

  locator.registerLazySingleton(() => GetCertificateTypeUseCase(locator()));

  locator.registerLazySingleton(() => UploadImageUseCase(locator()));
  locator.registerFactory<SplashViewModel>(
    () => SplashViewModel(locator<NavigationService>()),
  );

  locator.registerLazySingleton<CommonViewModel>(
    () => CommonViewModel(
      getCertificateTypeUseCase: locator<GetCertificateTypeUseCase>(),
      uploadImageUseCase: locator<UploadImageUseCase>(),
    ),
  );

  locator.registerFactory<AuthFlowViewModel>(() => AuthFlowViewModel());

  locator.registerFactory<OnBoardingViewModel>(
    () => OnBoardingViewModel(
      locator<NavigationService>(),
      locator<AuthFlowViewModel>(),
    ),
  );
}
