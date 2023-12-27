import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadAndPlayAudio();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadAndPlayAudio() async {
    final url = 'https://file-examples.com/storage/feaef18a3c6587263a0ed0e/2017/11/file_example_MP3_5MG.mp3'; // Replace with your audio URL
    await _audioPlayer.setUrl(url);
    await _audioPlayer.play();
    setState(() => _isPlaying = true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Music Player'),
        ),
        body: Center(
          child: IconButton(
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              _isPlaying ? _audioPlayer.pause() : _audioPlayer.play();
              setState(() => _isPlaying = !_isPlaying);
            },
          ),
        ),
      ),
    );
  }
}