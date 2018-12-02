import 'package:flutter/material.dart';

class NewsListPage extends StatefulWidget{

  @override
  State createState() {
    return new NewsListPageState();
  }
}

class NewsListPageState extends State<NewsListPage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text('NewsListPage'),
    );
  }
}