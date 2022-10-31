import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EmojisAnimation extends StatefulWidget {
  const EmojisAnimation({Key? key}) : super(key: key);

  @override
  State<EmojisAnimation> createState() => _EmojisAnimationState();
}

class _EmojisAnimationState extends State<EmojisAnimation> {
  late List emojiList;

  @override
  void initState() {
    super.initState();
    emojiList = [
      {
        'artboard': 'joy',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'love',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Tada',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Mindblown',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Onfire',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
      {
        'artboard': 'Bullseye',
        'animations': ['idle', 'Reveal'],
        'count': 0,
        'hover': OneShotAnimation('Hover', autoplay: false),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: emojiList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                emojiList[index]['hover'].isActive = true;
                setState(() {
                  emojiList[index]['count']++;
                });
              },
              child: Column(children: [
                Container(
                  height: 140,
                  margin: const EdgeInsets.all(10),
                  child: RiveAnimation.asset(
                    'assets/emojis.riv',
                    artboard: emojiList[index]['artboard'],
                    animations: emojiList[index]['animations'],
                    controllers: [emojiList[index]['hover']],
                  ),
                ),
                Text(
                  emojiList[index]['count'].toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]),
            );
          }),
    );
  }
}
