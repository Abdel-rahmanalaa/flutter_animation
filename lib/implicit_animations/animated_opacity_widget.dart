import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  bool _isOpacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedOpacity Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isOpacity ? 1.0 : 0.0,
                duration: const Duration(seconds: 4),
                curve: Curves.decelerate,
                child: const Text(
                  'Tom and Jerry are here',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isOpacity ? 1.0 : 0.0,
                duration: const Duration(seconds: 8),
                curve: Curves.easeInOut,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                  child: Image.asset('assets/tom.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isOpacity ? 1.0 : 0.0,
                duration: const Duration(seconds: 12),
                curve: Curves.linear,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                  child: Image.asset('assets/jerry.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isOpacity = !_isOpacity;
            });
          },
          child: Icon(_isOpacity ? Icons.visibility : Icons.visibility_off)),
    );
  }
}
