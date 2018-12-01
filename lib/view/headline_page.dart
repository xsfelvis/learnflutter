import 'package:flutter/material.dart';
import 'package:learnflutter/widgets/headline_list.dart';

class HeadLinePage extends StatefulWidget {
  final String title;

  const HeadLinePage({Key key, this.title}) : super(key: key);

  @override
  _HeadLinePageState createState() => new _HeadLinePageState();
}

//用于使用到了一点点的动画效果，因此加入了SingleTickerProviderStateMixin

class _HeadLinePageState extends State<HeadLinePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> newsTabs = <Tab>[
    new Tab(text: 'general'),
    new Tab(text: 'technology'),
    new Tab(text: 'business'),
    new Tab(text: 'entertainment'),
    new Tab(text: 'health'),
    new Tab(text: 'sports'),
    new Tab(text: 'science')
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: newsTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              tabs: newsTabs,
              isScrollable: true,
              controller: _tabController,
            )),
        body: TabBarView(
            controller: _tabController,
            children: newsTabs.map((Tab tab) {
              return HeadLineList(tab.text);
            }).toList()));
  }
}
