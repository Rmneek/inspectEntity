import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_asset_constants.dart';
import 'package:inspect_connect/core/utils/constants/app_colors.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/splash_flow/view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _logoBounceAnimation;
  late Animation<Offset> _textBounceAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _logoBounceAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(
          begin: Offset(0, 0),
          end: Offset(0, -0.05),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: Offset(0, -0.05),
          end: Offset(0, 0),
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(_controller);

    _textBounceAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(
          begin: Offset(0, 0.2),
          end: Offset(0, 0),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: Offset(0, 0),
          end: Offset(0, 0.05),
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(_controller);

    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      context.read<SplashViewModel>().start(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //     SlideTransition(
            //   position: _logoBounceAnimation,
            //   child: ScaleTransition(
            //     scale: _scaleAnimation,
            //     child: Image.asset(
            //       appLogo,
            //       color: AppColors.whiteColor,
            //       width: size.width * 0.2,
            //     ),
            //   ),
            // ),
            //    const SizedBox(height: 24),
            // SlideTransition(
            //   position: _textBounceAnimation,
            //   child: FadeTransition(
            //     opacity: _fadeAnimation,
            //     child: textWidget(
            //       text: "Inspect Connect",
            //       fontSize: 24,
            //       color: AppColors.whiteColor,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOutBack,
              ),
              child: Image.asset(
                appLogo,
                color: AppColors.whiteColor,
                width: size.width * 0.2,
              ),
            ),
            const SizedBox(height: 24),
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.4, 1, curve: Curves.easeIn),
              ),
              child: textWidget(
                text: inspectConnectTitle,
                fontSize: 24,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
