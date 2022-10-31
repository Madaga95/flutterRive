import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayAnimation extends StatefulWidget {
  const PlayAnimation({super.key});

  @override
  State<PlayAnimation> createState() => _PlayAnimationState();
}

class _PlayAnimationState extends State<PlayAnimation> {
  late RiveAnimationController _controller;

  void _togglePlay() {
    setState(() {
      _controller.isActive = !_controller.isActive;
    });
  }

  // nous permet de savoir si l'on a appuyer sur le bouton ou pas
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'assets/bird.riv',
          controllers: [_controller],
          onInit: (_) => setState(() {}),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        backgroundColor: Colors.pink.shade100,
        child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
