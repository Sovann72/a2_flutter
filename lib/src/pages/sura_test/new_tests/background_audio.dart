import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({Key? key}) : super(key: key);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;
  late Icon _icon;

  @override
  void initState() {
    _icon = Icon(Icons.play_arrow_rounded);
    super.initState();
    _controller = VideoPlayerController.network(
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
        "https://archive.org/download/Rick_Astley_Never_Gonna_Give_You_Up/Rick_Astley_Never_Gonna_Give_You_Up.mp4")
      ..initialize().then((_) {
        // print('\x1B[37m duration ${_controller.value.isPlaying}');
        // print('\x1B[37m playing ${_controller.value.}');

        _controller.addListener(
          () {
            print(
                '\x1B[32m ${_controller.value.isPlaying == true ? "playing" : "pause"}');
            if (_controller.value.isPlaying) {
              setState(() {
                _icon = const Icon(Icons.pause);
              });
            } else {
              setState(() {
                _icon = const Icon(Icons.play_arrow_rounded);
              });
            }
          },
        );
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio')),
      body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              // : Container(),
              : Text("not init")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: _icon,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}


// class MyBackgroundAudio extends StatefulWidget {
//   const MyBackgroundAudio({super.key});

//   @override
//   State<MyBackgroundAudio> createState() => _MyBackgroundAudioState();
// }

// class _MyBackgroundAudioState extends State<MyBackgroundAudio> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio'),
//         centerTitle: true,
//       ),
//       body: Center(
//           child: GestureDetector(
//         onTap: () {},
//         child: Icon(Icons.play_arrow_rounded),
//       )),
//     );
//   }
// }
