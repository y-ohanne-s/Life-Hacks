import 'dart:ui';
import 'package:flutter/material.dart';

Widget glassAppBar(String title, Widget leading) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 56),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.2),
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: leading,
        ),
      ),
    ),
  );
}

Widget background(ScrollController controller, Widget child) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('img/bg1.png'),
        fit: BoxFit.cover,
      ),
      color: Color(0xFFCBC3E3),
    ),
    height: double.infinity,
    width: double.infinity,
    child: child,
  );
}

Widget glassCard(
    BuildContext context, String content, double height, double width) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 24,
          spreadRadius: 24,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16,
          sigmaY: 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          height: height,
          width: width,
          child: width == 100
              ? Center(
                  child: Text(
                    content,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                  child: Text(
                    content,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
        ),
      ),
    ),
  );
}
