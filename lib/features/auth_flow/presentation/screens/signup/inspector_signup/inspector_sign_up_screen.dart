import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';

@RoutePage()
class InspectorSignUpView extends StatelessWidget {
  final bool showBackButton;
  const InspectorSignUpView({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: textWidget(text: "Inspector callled")),
    );
    // InspectorSignUpContent(showBackButton: showBackButton);
    //  ChangeNotifierProvider(
    //   create: (_) => InspectorViewModelProvider(),
    //   child: InspectorSignUpContent(showBackButton: showBackButton),
    // );
  }
}
