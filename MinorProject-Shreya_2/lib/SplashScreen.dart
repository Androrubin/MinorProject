import 'dart:ffi';

import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'LandingPage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashAnimation(),
    );
  }
}

class SplashAnimation extends StatefulWidget {
  @override
  _SplashAnimationState createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  static const double _list = 123.234;
  int _currentIndex = 0;
  final List<Widget> _screens = [
    SecondScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    _animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    // Navigate to the next screen after 2 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _screens[_currentIndex],
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      _animation.value * MediaQuery.of(context).size.width, 0),
                  child: child,
                );
              },
              child: AnimatedSize(
                duration: const Duration(seconds: 3),
                child: Image.asset('assets/menu_item.png',
                    height: 200, width: 200),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Mess Maven",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const Text("A less messy mess!",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }
}
