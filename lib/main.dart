import 'package:flutter/material.dart';
import 'package:video_widget_example/video_player_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the app's primary theme color
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Player'),
        ),
        body: Center(
          child: VideoPlayerApp(),
        ),
      ),
    );
  }
}
