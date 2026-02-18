import 'package:inspect_connect/core/basecomponents/base_view_model.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/navigation_service.dart';
import 'package:inspect_connect/core/utils/helpers/app_logger/app_logger.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navService;

  SplashViewModel(this._navService);

  Future<void> start() async {
    await Future.delayed(const Duration(milliseconds: 300));
    AppLogger.info('start');
    _navService.replace(const OnBoardingRoute());
  }

  @override
  void onDispose() {}
}
