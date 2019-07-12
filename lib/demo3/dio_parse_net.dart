import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/demo3/view/DiscoveryPage.dart';
import 'package:learnflutter/demo3/view/MyInfoPage.dart';
import 'package:learnflutter/demo3/view/NewsListPage.dart';
import 'package:learnflutter/demo3/view/SystemPage.dart';
import 'package:learnflutter/drawer_page.dart';
import 'package:learnflutter/router/route_study.dart';

class DioStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DioStudyState();
  }
}

class DioStudyState extends State<DioStudy> {
  //磨人索引第一个tab
  int _tabIndex = 0;

  // 正常情况的字体样式
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));

  // 选中情况的字体样式
  final tabTextStyleSelect = new TextStyle(color: Colors.blue);

  //底部菜单栏图标数组
  var tabImages;

  //页面内容
  var _body;

  //菜单文案
  var tabTitles = ['文章', '体系', '发现', '我的'];

  // 生成image组件
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return  new Scaffold(
        appBar: new AppBar(
            title: new Text(tabTitles[_tabIndex],
                style: new TextStyle(color: Colors.white)),
            iconTheme: new IconThemeData(color: Colors.white)),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: getBottomNavigationBarItem(),
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() => _tabIndex = index);
          },
        ),
    );
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }

    _body = new IndexedStack(
      children: <Widget>[
        new NewsListPage(),
        new SystemPage(),
        new DisconveryPage(),
        new MyinfoPage()
      ],
      index: _tabIndex,
    );
  }

  //获取菜单栏字体样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelect;
    } else {
      return tabTextStyleNormal;
    }
  }

  // 获取图标
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  // 获取标题文本
  Text getTabTitle(int curIndex) {
    return new Text(
      tabTitles[curIndex],
      style: getTabTextStyle(curIndex),
    );
  }

  // 获取BottomNavigationBarItem
  List<BottomNavigationBarItem> getBottomNavigationBarItem() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 4; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i), title: getTabTitle(i)));
    }
    return list;
  }
}
