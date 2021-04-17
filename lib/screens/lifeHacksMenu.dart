import 'dart:ui';
import 'package:life_hacks/screens/lifeHacks.dart';
import 'package:flutter/material.dart';
import 'package:life_hacks/utilities/lifeHacksModel.dart';
import 'package:life_hacks/screens/reusableWidgets.dart';

class LifeHacksMenu extends StatefulWidget {
  final List<LifeHacksModel> lifeHacks;

  const LifeHacksMenu({this.lifeHacks});

  @override
  _LifeHacksState createState() => _LifeHacksState();
}

class _LifeHacksState extends State<LifeHacksMenu> {
  var controller = ScrollController(initialScrollOffset: 0.0);

  GridView hacksMenu() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      controller: controller,
      itemBuilder: (context, i) {
        final hack = widget.lifeHacks[i];
        return Padding(
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LifeHacks(
                    hacks: hack,
                  ),
                ),
              );
            },
            child: glassCard(
              context,
              hack.menuTitle,
              100,
              100,
            ),
          ),
        );
      },
      itemCount: widget.lifeHacks.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: glassAppBar(
          'LIFE HACKS',
          IconButton(
            icon: Icon(
              Icons.lightbulb_outline,
              color: Color(0xFFEEAF0A),
            ),
            onPressed: () => setState(() => controller.jumpTo(1)),
          )),
      body: background(
        controller,
        hacksMenu(),
      ),
    );
  }
}
