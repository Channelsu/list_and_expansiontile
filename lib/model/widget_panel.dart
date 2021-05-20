import 'package:flutter/material.dart';

// 1枚1枚のパネルの設計図作成
class WidgetPanel {
  int id;
  String widgetName;
  Widget detailPage;

  WidgetPanel({this.id, this.widgetName, this.detailPage});
}