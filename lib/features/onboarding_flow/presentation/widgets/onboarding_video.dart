import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/constants/app_asset_constants.dart';
import 'package:video_player/video_player.dart';

class OnBoardingVideoBackground extends StatefulWidget {
  final Alignment alignment;

  const OnBoardingVideoBackground({required this.alignment, super.key});

  @override
  State<OnBoardingVideoBackground> createState() =>
      _OnBoardingVideoBackgroundState();
}

class _OnBoardingVideoBackgroundState extends State<OnBoardingVideoBackground>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _fade;

  @override
  void initState() {
    super.initState();
    _fade = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _init();
  }

  Future<void> _init() async {
    _controller = VideoPlayerController.asset(onBoardingVideo);
    await _controller.initialize();
    _controller
      ..setLooping(true)
      ..setVolume(0)
      ..play();
    _fade.forward();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    _fade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const SizedBox();
    }

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: MediaQuery.of(context).size.height * 0.85,
      child: AnimatedAlign(
        alignment: widget.alignment,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        child: FadeTransition(
          opacity: _fade,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
      ),
    );
  }
}
