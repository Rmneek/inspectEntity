import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inspect_connect/core/di/app_component/app_component.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart';
import 'package:inspect_connect/core/utils/helpers/app_flavor_helper/environment_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppComponentLocator();
  setupLocator();
  final AppFlavorsHelper configService = locator<AppFlavorsHelper>();
  final ProductFlavor? productFlavor = EnvironmentConfig.buildVariant
      .toProductFlavor();
  configService.configure(productFlavor: productFlavor);
  log(' buildVariant = ${EnvironmentConfig.buildVariant}');
  log(' Base URL = ${configService.baseUrl}');
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return
    //  MultiProvider(
    //   providers: [
    // ChangeNotifierProvider<WeatherDetailsViewModel>(
    //   create: (BuildContext context) => locator<WeatherDetailsViewModel>(),
    // ),
    // ChangeNotifierProvider<AddNewCityViewModel>(
    //   create: (BuildContext context) => locator<AddNewCityViewModel>(),
    // ),
    // ],
    // child:
    MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      // ),
    );
  }
}
