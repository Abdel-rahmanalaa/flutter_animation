import 'package:flutter/material.dart';

class AnimatedPostionedWidget extends StatefulWidget {
  const AnimatedPostionedWidget({super.key});

  @override
  State<AnimatedPostionedWidget> createState() =>
      _AnimatedPostionedWidgetState();
}

class _AnimatedPostionedWidgetState extends State<AnimatedPostionedWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPostioned Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 0,
              left: 0,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('assets/cheese.png'),
              ),
            ),
            AnimatedPositioned(
              top: 0,
              left: _isPressed ? MediaQuery.of(context).size.width - 140 : 0,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('assets/jerry.png'),
              ),
            ),
            AnimatedPositioned(
              top: _isPressed ? MediaQuery.of(context).size.height - 250 : 0,
              left: _isPressed ? MediaQuery.of(context).size.width - 150 : 0,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('assets/dog.png'),
              ),
            ),
            AnimatedPositioned(
              top: _isPressed ? MediaQuery.of(context).size.height - 250 : 0,
              left: 0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceInOut,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('assets/tom.png'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        child: _isPressed
            ? const Icon(Icons.back_hand_outlined)
            : const Icon(Icons.place_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
