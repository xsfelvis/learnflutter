import 'package:flutter/material.dart';
import 'package:learnflutter/demo3/dio_parse_net.dart';
import 'package:learnflutter/demo4/route_study.dart';
import 'package:learnflutter/demo4/static_router.dart';
import 'package:learnflutter/demo6/inheritedwidget/inhritagecontainer.dart';
import 'package:learnflutter/demo6/msgdispatch.dart';
import 'package:learnflutter/demo6/notification/notification_msg_dispatch.dart';
import 'package:learnflutter/drawer_page.dart';

void main() {
//  debugPaintSizeEnabled = true;      //打开视觉调试开关

  runApp(new MaterialApp(
//    theme: defaultTargetPlatform == TargetPlatform.iOS
//        ? kiOSTheme
//        : kAndroidTheme,
//    theme: kAndroidTheme,
    routes: <String, WidgetBuilder>{
      '/RoutePage': (BuildContext context) => new RouterStudy(),
      "RoutePage/Static_Route_Page": (context) => StaticRoute(),
      '/DioStudyPage': (BuildContext context) => new DioStudy(),
      '/MsgPatchMsgPage': (BuildContext context) => new MsgDispatchMsg(),
      'MsgPatchMsgPage/NotificationDisPatchMsgPage': (BuildContext context) =>
          new NotificationMsgDispatchMsg(),
      'MsgPatchMsgPage/InhritedWidgetDisPatchMsgPage': (BuildContext context) =>
          new InheritedWidgetTestContainer(),
    },
    home: new Scaffold(
      appBar: new AppBar(
          title: new Text("Flutter Study",
              style: new TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white)),
      body: Center(
        child: Text("点击侧栏"),
      ),
      drawer: Drawer(
        child: new DrawerPage(),
      ),
    ),
  ));
}
