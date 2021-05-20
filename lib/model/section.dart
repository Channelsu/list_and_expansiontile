import 'package:flutter/material.dart';
import 'package:listandexpansiontile/model/widget_panel.dart';

// 表示する項目の設計図作成
class Section {
  String sectionName;
  List<WidgetPanel> widgetPanels;

  Section({this.sectionName, this.widgetPanels});
}
