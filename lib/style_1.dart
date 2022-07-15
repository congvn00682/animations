import 'package:flutter/material.dart';

class Style1 extends StatefulWidget {
  const Style1({Key? key}) : super(key: key);

  @override
  State<Style1> createState() => _Style1State();
}

class _Style1State extends State<Style1> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  _toggleAnimation() {
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(
        0,
        duration: const Duration(milliseconds: 1500),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expand Menu'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () => _toggleAnimation(),
              child: const Text("Toggle"),
            ),
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              child: const Text(
                "This can have variable size",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              child: const Text(
                "This can have variable size",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
