import 'package:flutter/material.dart';
import 'package:learnflutter/dio/dio_parse_net.dart';
import 'package:learnflutter/router/route_study.dart';
import 'package:learnflutter/router/static_router.dart';
import 'package:learnflutter/msgdispatch/inheritedwidget/inhritagecontainer.dart';
import 'package:learnflutter/msgdispatch/msgdispatch.dart';
import 'package:learnflutter/msgdispatch/notification/notification_msg_dispatch.dart';
import 'package:learnflutter/homepage/homepageres.dart';
import 'generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'homepage/layout_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var scContext;
  bool isShowBottonSheet = false;

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
//          title: Text("Flutter实验中心"),
          title: Text("Flutter实验中心"),
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
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        // 如果需要强制使用某种语言可以添加如下代码
        localeResolutionCallback:
            S.delegate.resolution(fallback: Locale("zh", "CN")),
//        title: S.of(context).flutter_study,
        title: "Flutter Study",
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
