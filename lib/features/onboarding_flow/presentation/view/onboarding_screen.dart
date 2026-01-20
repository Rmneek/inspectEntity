import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/app_presentation/app_common_text_widget.dart';
import 'package:inspect_connect/core/utils/constants/app_asset_constants.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/widgets/onboarding_actions.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/widgets/onboarding_toggle.dart';
import 'package:inspect_connect/features/onboarding_flow/presentation/widgets/onboarding_video.dart';
import 'package:inspect_connect/features/onboarding_flow/view_model/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => OnBoardingScreenState();
// }

// class OnBoardingScreenState extends State<OnBoardingScreen>
//     with TickerProviderStateMixin {
//   late VideoPlayerController _videoController;
//   late AnimationController _fadeController;

//   bool _videoInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     _loadVideo(onBoardingVideo);
//   }

//   Future<void> _loadVideo(String assetPath) async {
//     if (_videoInitialized) return;
//     _videoInitialized = true;

//     _videoController = VideoPlayerController.asset(assetPath);
//     await _videoController.initialize();
//     _videoController
//       ..setLooping(true)
//       ..setVolume(0)
//       ..play();

//     if (mounted) setState(() {});
//     _fadeController.forward();
//   }

//   bool isDisposed = false;
//   @override
//   void dispose() {
//     isDisposed = true;
//     try {
//       if (_videoController.value.isInitialized) {
//         _videoController.pause();
//       }
//       _videoController.dispose();
//     } catch (_) {}
//     _fadeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             height: size.height * 0.85,
//             child: AnimatedAlign(
//               alignment: vm.videoAlignment,
//               duration: const Duration(milliseconds: 800),
//               curve: Curves.easeInOut,
//               child: _videoController.value.isInitialized
//                   ? FadeTransition(
//                       opacity: _fadeController,
//                       child: FittedBox(
//                         fit: BoxFit.cover,
//                         child: SizedBox(
//                           width: _videoController.value.size.width,
//                           height: _videoController.value.size.height,
//                           child: VideoPlayer(_videoController),
//                         ),
//                       ),
//                     )
//                   : const Center(
//                       child: CircularProgressIndicator(color: Colors.white),
//                     ),
//             ),
//           ),

//           SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Spacer(),

//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 600),
//                   child: textWidget(
//                     key: ValueKey(vm.headline),
//                     text: vm.headline,
//                     color: Colors.white,
//                     fontSize: 23,
//                     fontWeight: FontWeight.bold,
//                     alignment: TextAlign.center,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 _UserToggle(vm: vm),

//                 const SizedBox(height: 20),

//                 if (vm.showAuthOptions) _AuthButtons(vm: vm),

//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnBoardingViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          OnBoardingVideoBackground(alignment: vm.videoAlignment),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    child: textWidget(
                      // key: ValueKey(vm.headline),
                      text: vm.headline,
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      alignment: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 20),

                  OnBoardingToggle(onSelect: vm.selectUser),

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
}
