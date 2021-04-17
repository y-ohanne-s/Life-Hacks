import 'package:flutter/material.dart';
import 'package:life_hacks/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Hacks',
      home: SplashScreen(),
    );
  }
}
