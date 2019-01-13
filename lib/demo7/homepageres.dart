//---------------------------TabBar+tabBarView--------------------------------
import 'package:flutter/material.dart';
import 'package:learnflutter/drawer_page.dart';

var chartLi = ["page1", "page2", "page3", "page4"];

var tabBarView = new TabBarView(
  children: chartLi.map((text) {
    return Center(
        child: Text(
      text,
      style: TextStyle(fontSize: 20),
    ));
  }).toList(),
);

var tabBar = TabBar(
  labelStyle: TextStyle(fontSize: 20),
  labelColor: Color(0xff4B0082),
  unselectedLabelColor: Colors.white,
  tabs: chartLi.map((item) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text(item),
      height: 40,
    );
  }).toList(),
);

var drawer = Drawer(
  child: new DrawerPage(),
);

var bottomSheet = BottomSheet(
    onClosing: () {},
    builder: (context) => (Container(
        color: Color(0xffABF5E0),
        child: Wrap(
          children: <Widget>[
            Center(child: Text('test1')),
            Center(child: Text('test2')),
            Center(child: Text('test3')),
            Center(child: Text('test4')),
          ],
        ))));

var iconInfoMap = {
  "首页": Icon(Icons.home),
  "消息": Icon(Icons.comment),
  "动态": Icon(Icons.toys),
  "联系人": Icon(Icons.contacts),
};

var bottomNavigationBar = BottomNavigationBar(
  items: () {
    var items = <BottomNavigationBarItem>[];
    iconInfoMap.forEach((k, v) {
      items.add(BottomNavigationBarItem(
          title: Text(k), icon: v, backgroundColor: Color(0xff49B1FB)));
    });
    return items;
  }(),
  currentIndex: 1,
  onTap: (position) {
    print(position);
  },
);
