import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BirdAnimation extends StatefulWidget {
  const BirdAnimation({super.key});

  @override
  State<BirdAnimation> createState() => _BirdAnimationState();
}

class _BirdAnimationState extends State<BirdAnimation> {
  late RiveAnimationController _lookUpController;
  late RiveAnimationController _danceController;

  bool _isLookingUp = false;
  bool _isDancing = false;

  @override
  void initState() {
    super.initState();
    _lookUpController = OneShotAnimation(
      'lookUp',
      autoplay: false,
      onStop: () => setState(() => _isLookingUp = false),
      onStart: () => setState(() => _isLookingUp = true),
    );

    _danceController = OneShotAnimation(
      'slowDance',
      autoplay: false,
      onStop: () => setState(() => _isDancing = false),
      onStart: () => setState(() => _isDancing = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'assets/bird.riv',
          animations: const ['idle'],
          controllers: [_lookUpController, _danceController],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _isLookingUp ? null : _lookUpController.isActive = true;
            },
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              _isDancing
                  ? _danceController.isActive = false
                  : _danceController.isActive = true;
            },
            child: Icon(_isDancing ? Icons.music_off : Icons.music_note),
          )
        ],
      ),
    );
  }
}
