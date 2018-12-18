import 'package:flutter/material.dart';

class MyWelcomeInfo extends InheritedWidget {
  final String welcomeInfo;

  MyWelcomeInfo({Key key, @required this.welcomeInfo, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyWelcomeInfo oldWidget) {
    return welcomeInfo != oldWidget.welcomeInfo;
  }
}
