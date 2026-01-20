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
  }

  @override
  void dispose() {
    _controller.dispose();
    _fade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: widget.alignment,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      child: FadeTransition(opacity: _fade, child: VideoPlayer(_controller)),
    );
  }
}
