import 'package:flutter/material.dart';

class CrossFadeAnimation extends StatefulWidget {
  final Widget firstChild;
  final Widget secondChild;
  final bool showFirst;

  const CrossFadeAnimation({
    required this.firstChild,
    required this.secondChild,
    this.showFirst = true,
    super.key,
  });

  @override
  State<CrossFadeAnimation> createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    if (widget.showFirst) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CrossFadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showFirst) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.showFirst ? widget.firstChild : widget.secondChild,
    );
  }
}
