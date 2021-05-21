import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String widgetNameTitle;

  DetailPage({this.widgetNameTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetNameTitle),
      ),
      body: Container(
        height: double.infinity,
      ),
    );
  }
}