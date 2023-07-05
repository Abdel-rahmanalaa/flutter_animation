import 'package:flutter/material.dart';

class AnimatedTextStyleWidget extends StatefulWidget {
  const AnimatedTextStyleWidget({super.key});

  @override
  State<AnimatedTextStyleWidget> createState() =>
      _AnimatedTextStyleWidgetState();
}

class _AnimatedTextStyleWidgetState extends State<AnimatedTextStyleWidget> {
  double _fontSize = 30;
  Color _color = Colors.black26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            style: TextStyle(fontSize: _fontSize, color: _color),
            duration: const Duration(seconds: 1),
            curve: Curves.bounceInOut,
            child: const Text('AnimatedText'),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: _setAnimationValuesToStart,
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: _setAnimationValuesToRestart,
                icon: const Icon(Icons.remove),
              )
            ],
          ),
        ],
      ),
    );
  }

  _setAnimationValuesToStart() {
    setState(() {
      _fontSize = 50;
      _color = Colors.orange;
    });
  }

  _setAnimationValuesToRestart() {
    setState(() {
      _fontSize = 30;
      _color = Colors.black26;
    });
  }
}
