import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatefulWidget {
  @override
  _VideoPlayerAppState createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {
  VideoPlayerController? _controller;
  bool _isMuted = false; // Track mute/unmute state

  @override
  void initState() {
    super.initState();

    // Initialize the VideoPlayerController with a video from assets.
    _controller = VideoPlayerController.asset('assets/test.mp4');

    // Initialize the controller and update the UI when complete.
    _controller!.initialize().then((_) {
      setState(() {}); // Refresh the UI once the video is ready
      _controller!.play(); // Play the video automatically
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller != null && _controller!.value.isInitialized
            ? Stack(
          children: [
            VideoPlayer(_controller!),
            Positioned(
              bottom: 20,
              right: 20,
              child: IconButton(
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.black54,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _isMuted = !_isMuted;
                    _controller!.setVolume(_isMuted ? 0 : 1); // Mute/unmute
                  });
                },
              ),
            ),
          ],
        )
            : CircularProgressIndicator(), // Show a loader while the video initializes
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose(); // Dispose of the VideoPlayerController
  }
}
