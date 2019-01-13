import 'package:flutter/material.dart';
import 'package:learnflutter/demo3/dio_parse_net.dart';
import 'package:learnflutter/demo4/route_study.dart';
import 'package:learnflutter/demo4/static_router.dart';
import 'package:learnflutter/demo6/inheritedwidget/inhritagecontainer.dart';
import 'package:learnflutter/demo6/msgdispatch.dart';
import 'package:learnflutter/demo6/notification/notification_msg_dispatch.dart';
import 'package:learnflutter/demo7/homepageres.dart';
import 'package:learnflutter/demo7/layout_test.dart';

//void main() {
////  debugPaintSizeEnabled = true;      //打开视觉调试开关
//
//  runApp(new MaterialApp(
////    theme: defaultTargetPlatform == TargetPlatform.iOS
////        ? kiOSTheme
////        : kAndroidTheme,
////    theme: kAndroidTheme,
//    routes: <String, WidgetBuilder>{
//      '/RoutePage': (BuildContext context) => new RouterStudy(),
//      "RoutePage/Static_Route_Page": (context) => StaticRoute(),
//      '/DioStudyPage': (BuildContext context) => new DioStudy(),
//      '/MsgPatchMsgPage': (BuildContext context) => new MsgDispatchMsg(),
//      'MsgPatchMsgPage/NotificationDisPatchMsgPage': (BuildContext context) =>
//      new NotificationMsgDispatchMsg(),
//      'MsgPatchMsgPage/InhritedWidgetDisPatchMsgPage': (BuildContext context) =>
//      new InheritedWidgetTestContainer(),
//    },
//    home: new Scaffold(
//      appBar: new AppBar(
//          title: new Text("Flutter Study",
//              style: new TextStyle(color: Colors.white)),
//          iconTheme: new IconThemeData(color: Colors.white)),
//      body: Center(
//        child: Text("点击侧栏"),
//      ),
//      drawer:,
//    ),
//  ));
//}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var scContext;
  bool isShowBottonSheet = false;

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
          title: Text("homepageUI"),
          bottom: tabBar,
          backgroundColor: Color(0xff54C5F8),
          centerTitle: true,
          toolbarOpacity: .4),
      body: Builder(builder: (context) {
        scContext = context;
        return juejincard1;
      }),
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isShowBottonSheet
              ? Scaffold.of(scContext).hideCurrentSnackBar()
              : Scaffold.of(scContext).showBottomSheet(bottomSheet.builder);
          isShowBottonSheet = !isShowBottonSheet;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );

    return MaterialApp(
        title: 'Flutter Study',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: new DefaultTabController(length: 4, child: scaffold),
        routes: <String, WidgetBuilder>{
          '/RoutePage': (BuildContext context) => new RouterStudy(),
          "RoutePage/Static_Route_Page": (context) => StaticRoute(),
          '/DioStudyPage': (BuildContext context) => new DioStudy(),
          '/MsgPatchMsgPage': (BuildContext context) => new MsgDispatchMsg(),
          'MsgPatchMsgPage/NotificationDisPatchMsgPage':
              (BuildContext context) => new NotificationMsgDispatchMsg(),
          'MsgPatchMsgPage/InhritedWidgetDisPatchMsgPage':
              (BuildContext context) => new InheritedWidgetTestContainer(),
        });
  }
}
