import 'package:flutter/material.dart';
import 'package:learnflutter/view/headline_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "News",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HeadLinePage(title: 'Headlines')
    );
  }
}

