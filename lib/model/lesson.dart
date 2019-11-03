import 'package:flutter/cupertino.dart';

class Lesson {
  String title;
  String level;
  double indicatorValue;
  int price;
  String content;
  Color colorTitle;
  Color colorSub;

  Lesson(
      {this.title, this.level, this.indicatorValue, this.price, this.content, this.colorTitle, this.colorSub});
}
