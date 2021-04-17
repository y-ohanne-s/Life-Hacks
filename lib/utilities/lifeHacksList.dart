import 'package:flutter/cupertino.dart';
import 'package:life_hacks/utilities/lifeHacksModel.dart';
import 'dart:convert';

class LifeHacksList {
  static Future<List<LifeHacksModel>> getHacks(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/hacks.json');
    final body = jsonDecode(data);

    return body.map<LifeHacksModel>(LifeHacksModel.fromJson).toList();
  }
}
