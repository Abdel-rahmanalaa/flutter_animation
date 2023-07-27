import 'package:flutter/material.dart';

class AnimatedPostionedDirectionalWidget extends StatefulWidget {
  const AnimatedPostionedDirectionalWidget({super.key});

  @override
  State<AnimatedPostionedDirectionalWidget> createState() =>
      _AnimatedPostionedDirectionalWidgetState();
}

class _AnimatedPostionedDirectionalWidgetState
    extends State<AnimatedPostionedDirectionalWidget> {
  double _start = 0;
  double _top = 0;

  _moveLeft() {
    setState(() {
      _start -= 50;
      if (_start < 0) {
        _start = 0;
      }
    });
  }

  _moveRight() {
    setState(() {
      _start += 50;
      if (_start > MediaQuery.of(context).size.width - 120) {
        _start = MediaQuery.of(context).size.width - 120;
      }
    });
  }

  _moveUp() {
    setState(() {
      _top -= 50;
      if (_top < 0) {
        _top = 0;
      }
    });
  }

  _moveDown() {
    setState(() {
      _top += 50;
      if (_top > MediaQuery.of(context).size.height - 320) {
        _top = MediaQuery.of(context).size.height - 320;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPostionedDirectional Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
              start: _start,
              top: _top,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/jerry.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _moveLeft,
                    child: const Icon(Icons.arrow_left_rounded),
                  ),
                  ElevatedButton(
                    onPressed: _moveUp,
                    child: const Icon(Icons.arrow_drop_up_rounded),
                  ),
                  ElevatedButton(
                    onPressed: _moveDown,
                    child: const Icon(Icons.arrow_drop_down_rounded),
                  ),
                  ElevatedButton(
                    onPressed: _moveRight,
                    child: const Icon(Icons.arrow_right_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
