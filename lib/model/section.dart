import 'package:flutter/material.dart';

// 表示する項目の設計図作成
class Section {
  String sectionName;
  List<Map<String, dynamic>> widgets;

  Section({this.sectionName, this.widgets});
}
