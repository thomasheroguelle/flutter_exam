import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoHero extends StatefulWidget {
  const VideoHero({Key? key}) : super(key: key);

  @override
  State<VideoHero> createState() => _VideoHeroState();
}

class _VideoHeroState extends State<VideoHero> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  void _initializeVideoController() {
    _controller = VideoPlayerController.asset('assets/video/v1.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
        });
      })
      ..addListener(() {})
      ..setVolume(1.0)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}