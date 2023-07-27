import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  const AnimatedPhysicalModelWidget({super.key});

  @override
  State<AnimatedPhysicalModelWidget> createState() =>
      _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState
    extends State<AnimatedPhysicalModelWidget> {
  bool _isPressed = false;
  _toggleElevation() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Physical Model Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _toggleElevation(),
          child: AnimatedPhysicalModel(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey,
            shadowColor: Colors.blueGrey.shade300,
            elevation: _isPressed ? 60 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
            child: SizedBox(
              width: 250,
              height: 300,
              child: Image.asset('assets/tom.png'),
            ),
          ),
        ),
      ),
    );
  }
}
