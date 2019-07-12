import 'package:flutter/material.dart';
import 'package:learnflutter/news/view/HeadLinePage.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "News",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HeadLinePage(title: '新闻大全'));
  }
}