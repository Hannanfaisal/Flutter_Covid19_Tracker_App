import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/View/splash_screen.dart';

void main() {
  runApp(const CovidTracker());
}

class CovidTracker extends StatelessWidget {
  const CovidTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Tracker App',
      theme: ThemeData(
           brightness: Brightness.dark, 
           primarySwatch: Colors.blue
           ),
      home: const SplashScreen(),
    );
  }
}
