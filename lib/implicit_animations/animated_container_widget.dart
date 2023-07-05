import 'package:flutter/material.dart';

class AnimatedContainrWidget extends StatefulWidget {
  const AnimatedContainrWidget({super.key});

  @override
  State<AnimatedContainrWidget> createState() => _AnimatedContainrWidgetState();
}

class _AnimatedContainrWidgetState extends State<AnimatedContainrWidget> {
  late double _width;
  late double _hieght;
  late Color _color;

  @override
  void initState() {
    super.initState();
    _getDefaultValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _setAnimationValues();
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceInOut,
            decoration: BoxDecoration(
                color: _color,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            width: _width,
            height: _hieght,
            child: Image.asset('assets/jerry.png'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _getDefaultValues();
          });
        },
        child: const Icon(Icons.restart_alt_outlined),
      ),
    );
  }

  void _setAnimationValues() {
    setState(() {
      _width = 300;
      _hieght = 300;
      _color = Colors.orange;
    });
  }

  void _getDefaultValues() {
    _width = 100;
    _hieght = 100;
    _color = Colors.black26;
  }
}
