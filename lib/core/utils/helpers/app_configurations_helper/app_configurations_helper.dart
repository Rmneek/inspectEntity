import 'package:inspect_connect/core/di/app_component/app_component.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart';
import 'package:inspect_connect/core/utils/helpers/app_theme_helper/custom_theme_data.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfigurations {
  String? get baseUrl => locator<AppFlavorsHelper>().baseUrl;
  CustomThemeData appTheme = CustomThemeData(
    buttonEnabledColor: AppColors.authThemeColor,
    buttonDisabledColor: AppColors.disableColor,
    primaryColor: AppColors.authThemeColor,
    validColor: AppColors.successColor,
    secondaryColor: AppColors.white70Color,
    thirdColor: AppColors.greyColor,
    backgroundLightColor: AppColors.whiteColor,
    backgroundGreyColor: AppColors.greyColor,
    errorColor: AppColors.errorColor,
    loaderColor: AppColors.authThemeColor,
    subTitleTextColor: AppColors.black,
    titleTextColor: AppColors.black,
  );
}
