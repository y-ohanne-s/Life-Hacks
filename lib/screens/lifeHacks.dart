import 'package:flutter/material.dart';
import 'package:life_hacks/screens/reusableWidgets.dart';
import 'package:life_hacks/utilities/lifeHacksModel.dart';

class LifeHacks extends StatefulWidget {
  final LifeHacksModel hacks;

  const LifeHacks({this.hacks});
  @override
  _LifeHacksState createState() => _LifeHacksState();
}

class _LifeHacksState extends State<LifeHacks> {
  ListView hacksList() {
    return ListView.builder(
      itemCount: widget.hacks.content.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(30, 200, 20, 150),
          child: glassCard(
            context,
            widget.hacks.content[index],
            300,
            300,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: glassAppBar(
        widget.hacks.menuTitle,
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: background(
        null,
        hacksList(),
      ),
    );
  }
}
