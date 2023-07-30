import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  late bool _isFirstWidgetVisible;
  
  @override
  void initState() {
    super.initState();
    _isFirstWidgetVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrosFade Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            _isFirstWidgetVisible = !_isFirstWidgetVisible;
          }),
          child: AnimatedCrossFade(
            firstChild: Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: Image.asset('assets/jerry.png'),
            ),
            firstCurve: Curves.linear,
            secondChild: Container(
              width: 200,
              height: 200,
              color: Colors.blueGrey,
              child: Image.asset('assets/dog.png'),
            ),
            secondCurve: Curves.linear,
            crossFadeState: _isFirstWidgetVisible
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 1000),
          ),
        ),
      ),
    );
  }
}
