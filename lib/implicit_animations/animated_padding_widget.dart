import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  List<String> characters = ['tom', 'jerry', 'dog', 'cheese'];
  double _paddingValue = 10;
  bool _isPadding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPadding Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            characters.length,
            (index) => AnimatedPadding(
              padding: EdgeInsets.all(_paddingValue),
              duration: const Duration(seconds: 2),
              curve: Curves.decelerate,
              child: Container(
                width: 100,
                height: 100,
                color:  Theme.of(context).primaryColor,
                child: Image.asset('assets/${characters[index]}.png'),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isPadding = !_isPadding;
              _paddingValue = _isPadding ? 30 : 10;
            });
          },
          child: Icon(_isPadding
              ? Icons.zoom_in_map_rounded
              : Icons.zoom_out_map_rounded)),
    );
  }
}
