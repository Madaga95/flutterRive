import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoaderAnimation extends StatefulWidget {
  const LoaderAnimation({super.key});

  @override
  State<LoaderAnimation> createState() => _LoaderAnimationState();
}

class _LoaderAnimationState extends State<LoaderAnimation> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: _isLoading
                ? const RiveAnimation.asset(
                    'assets/loader.riv',
                  )
                : const Center(
                    child: Text('Rien à afficher'),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  _isLoading = !_isLoading;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _isLoading
                    ? [
                        const Icon(Icons.pause),
                        const SizedBox(width: 10),
                        const Text('Arrêter le chargement')
                      ]
                    : [
                        const Icon(Icons.play_arrow),
                        const SizedBox(width: 10),
                        const Text('Lancer le chargement')
                      ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
