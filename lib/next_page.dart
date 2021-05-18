import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  String widgetNameTitle;

  NextPage({this.widgetNameTitle});

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