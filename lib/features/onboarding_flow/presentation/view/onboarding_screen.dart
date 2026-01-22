import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/widgets/onboarding_actions.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/widgets/onboarding_toggle.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/widgets/onboarding_video.dart';
import 'package:inspect_connect/features/onboarding_flow/view_model/onboarding_view_model.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnBoardingViewModel>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          OnBoardingVideoBackground(alignment: vm.videoAlignment),

          _topGradient(size),
          _bottomGradient(size),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    ),
                    child: Padding(
                      key: ValueKey(vm.headline),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: textWidget(
                        text: vm.headline,
                        color: AppColors.whiteColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        alignment: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  OnBoardingToggle(
                    isClient: vm.isClient,
                    onSelect: vm.selectUser,
                    showActions: vm.showActions,
                  ),

                  const SizedBox(height: 20),

                  if (vm.showActions)
                    OnBoardingActions(
                      onCreate: () => vm.createAccount(context),
                      onLogin: () => vm.login(context),
                    ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topGradient(Size size) => Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: size.height * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black.withValues(alpha: 0)],
        ),
      ),
    ),
  );

  Widget _bottomGradient(Size size) => Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.45, 0.6, 1.0],
          colors: [
            Colors.black.withValues(alpha: 0),
            Colors.black.withValues(alpha: 0.85),
            Colors.black,
          ],
        ),
      ),
    ),
  );
}
