import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  int _jerryAligment = 0;
  int _tomAligment = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedAlign Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: _getNextAligment(_jerryAligment),
            duration: const Duration(
              milliseconds: 200,
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
              child: Image.asset('assets/jerry.png'),
            ),
          ),
          AnimatedAlign(
            alignment: _getNextAligment(_tomAligment),
            duration: const Duration(
              milliseconds: 200,
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
              child: Image.asset('assets/tom.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _jerryAligment = ++_jerryAligment;
            _tomAligment = ++_tomAligment;
          });
        },
        child: const Icon(Icons.animation_outlined),
      ),
    );
  }

  Alignment _getNextAligment(int aligment) {
    switch (aligment) {
      case 1:
        return Alignment.topCenter;
      case 3:
        return Alignment.topRight;
      case 2:
        return Alignment.centerLeft;
      case 5:
        return Alignment.center;
      case 6:
        return Alignment.centerRight;
      case 4:
        return Alignment.bottomLeft;
      case 8:
        return Alignment.bottomCenter;
      case 7:
        return Alignment.bottomRight;
      default:
        _jerryAligment = 0;
        _tomAligment = 1;
        return Alignment.topLeft;
    }
  }
}
