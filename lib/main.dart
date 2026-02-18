import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inspect_connect/core/di/app_component/app_component.dart';
import 'package:inspect_connect/core/utils/auto_router_setup/auto_router.dart';
import 'package:inspect_connect/core/utils/helpers/app_flavor_helper/app_flavors_helper.dart';
import 'package:inspect_connect/core/utils/helpers/app_flavor_helper/environment_config.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/auth_flow_provider.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/client_view_model.dart';
import 'package:inspect_connect/features/common_features/view_model/common_view_model.dart';
import 'package:provider/provider.dart';

Future<void> initializeFirebaseMessaging() async {
  await Firebase.initializeApp();
}

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
  await initializeFirebaseMessaging();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = locator<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<AuthFlowViewModel>()),
        ChangeNotifierProvider(
          create: (_) => locator<ClientViewModelProvider>(),
        ),
        ChangeNotifierProvider(create: (_) => locator<CommonViewModel>()),
      ],

      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
