import 'package:flutter/material.dart';
import 'package:learnflutter/demo6/inhritagecontainer.dart';
import 'package:learnflutter/demo6/test/inheritdata.dart';
import 'package:learnflutter/demo6/test/nestchild.dart';

class Main6Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Container(
//        child: MyWelcomeInfo(welcomeInfo: 'hello flutter', child: MyNestedChild()));
    child: InheritedWidgetTestContainer());
  }
}
