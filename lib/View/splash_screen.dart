import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_covid_tracker/View/world_states_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WorldStatesScreen())));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: ((BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2.5 * math.pi,
                child: child,
              );
            }),
            child: Container(
              height: 200,
              width: 200,
              child: const Center(
                child: Image(image: AssetImage('images/virus.png')),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ))
        ],
      ),
    );
  }
}
