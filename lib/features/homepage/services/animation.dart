// File: animation.dart
// Author: Sconl Peter
// Email: sconl@proton.me
// Description: Defines all animations for the homepage

import 'package:flutter/material.dart';

class CustomCircleAnimation extends StatefulWidget {
  final Widget child;

  CustomCircleAnimation({required this.child});

  @override
  _CustomCircleAnimationState createState() => _CustomCircleAnimationState();

  void forward() {}
}

class _CustomCircleAnimationState extends State<CustomCircleAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void forward() {
    _controller.forward();
  }

  void reverse() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
