import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/features/auth_flow/presentation/screens/signup/inspector_signup/sign_up_steps/inspector_sign_up_content_screen.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';
import 'package:provider/provider.dart';

@RoutePage()
class InspectorSignUpView extends StatelessWidget {
  final bool showBackButton;
  const InspectorSignUpView({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => InspectorViewModelProvider(),
        child: InspectorSignUpContent(showBackButton: showBackButton),
      ),
    );
  }
}
