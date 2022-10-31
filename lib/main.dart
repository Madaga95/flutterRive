import 'package:flutter/material.dart';
import 'play_animation.dart';
import 'bird_animation.dart';
import 'loader_animation.dart';
import 'emojis_animation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Rive';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const PlayAnimation(),
    const BirdAnimation(),
    const LoaderAnimation(),
    const EmojisAnimation()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Flutter Rive Animation'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'Play/Pause',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash),
            label: 'Flutter Bird',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Chargement',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Emojis',
            backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey.shade300,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
