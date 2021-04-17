import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:life_hacks/screens/lifeHacksMenu.dart';
import 'package:life_hacks/utilities/lifeHacksList.dart';
import 'package:life_hacks/utilities/lifeHacksModel.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _terminateSplashScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return FutureBuilder<List<LifeHacksModel>>(
            future: LifeHacksList.getHacks(context),
            builder: (context, snapshot) {
              final hacks = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  return LifeHacksMenu(
                    lifeHacks: hacks,
                  );
              }
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    _terminateSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('img/lightBulb.png'),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF001D43),
            Color(0xFF006DB5),
            Color(0xFF46D4BF),
            Color(0xFFF3BF21),
            Color(0xFFEEAF0A),
          ],
        ),
      ),
    );
  }
}
