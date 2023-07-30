import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool _isFirstWidgetVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedSwitcher Widget"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: AnimatedSwitcher(
          switchInCurve: Curves.bounceInOut,
          switchOutCurve: Curves.decelerate,
          duration: const Duration(seconds: 1),
          child: _isFirstWidgetVisible
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isFirstWidgetVisible = !_isFirstWidgetVisible;
                    });
                  },
                  child: const Text("Login Now!"),
                )
              : const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.switch_account),
        onPressed: () {
          setState(() {
            _isFirstWidgetVisible = !_isFirstWidgetVisible;
          });
        },
      ),
    );
  }
}
