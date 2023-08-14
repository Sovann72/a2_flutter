import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:soriya_flutter/soriya_flutter.dart';
import 'package:sura_manager/sura_manager.dart';
import 'package:video_player/video_player.dart';

class VideoResultPopup extends StatefulWidget {
  final File video;
  const VideoResultPopup({super.key, required this.video});

  @override
  State<VideoResultPopup> createState() => _VideoResultPopupState();
}

class _VideoResultPopupState extends State<VideoResultPopup> {
  FutureManager loadingPage = FutureManager();
  late VideoPlayerController _controller;

  void initController() async {
    void playLoop() {
      if (_controller.value.position == _controller.value.duration) {
        _controller.seekTo(Duration.zero);
        _controller.play();
      }
    }

    try {
      debugPrint("\x1B[32m[file.path]: ${widget.video.path}");

      _controller = VideoPlayerController.file(widget.video)
        ..initialize()
        ..setVolume(0.1)
        ..play();
      _controller.addListener(playLoop);
    } catch (e) {
      debugPrint("\x1B[31m[error]: $e");
    }
    // setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadingPage.asyncOperation(() async {
      initController();
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("result"),
      ),
      body: FutureManagerBuilder(
          futureManager: loadingPage,
          ready: (context, data) {
            return Center(
                child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller)));
          }),
    );
  }
}
