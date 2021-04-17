class LifeHacksModel {
  String menuTitle;
  List<String> content;

  LifeHacksModel({this.menuTitle, this.content});

  static LifeHacksModel fromJson(json) {
    var contentFromJson = json['content'];
    List<String> contentList = List<String>.from(contentFromJson);
    return LifeHacksModel(
      menuTitle: json['menuTitle'],
      content: contentList,
    );
  }
}
