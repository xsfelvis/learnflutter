import 'package:flutter/material.dart';
import 'package:learnflutter/bloc/bloc_provider.dart';
import 'package:learnflutter/bloc/first_page.dart';
import 'package:learnflutter/dio/dio_parse_net.dart';
import 'package:learnflutter/keys/statefull_not_work.dart';
import 'package:learnflutter/keys/statefull_random.dart';
import 'package:learnflutter/keys/stateless_work.dart';
import 'package:learnflutter/overlay/learnoverlay.dart';
import 'package:learnflutter/router/route_study.dart';
import 'package:learnflutter/router/static_router.dart';
import 'package:learnflutter/msgdispatch/inheritedwidget/inhritagecontainer.dart';
import 'package:learnflutter/msgdispatch/msgdispatch.dart';
import 'package:learnflutter/msgdispatch/notification/notification_msg_dispatch.dart';
import 'package:learnflutter/homepage/homepageres.dart';
import 'generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'keys/keys_entrance.dart';
import 'keys/statefull_work.dart';
import 'local_const.dart';

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

    return new BlocProvider(
        child: MaterialApp(
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
              local_const.ROUTE_PAGE: (BuildContext context) =>
                  new RouterStudy(),
              local_const.STATIC_ROUTE_PAGE: (context) => StaticRoute(),
              local_const.DIO_PAGE: (BuildContext context) => new DioStudy(),
              local_const.MSG_DISPATCH_PAGE: (BuildContext context) =>
                  new MsgDispatchMsg(),
              local_const.NOTIFICATION_DISPATCH_PAGE: (BuildContext context) =>
                  new NotificationMsgDispatchMsg(),
              local_const.INHRITED_DISPATCH_PAGE: (BuildContext context) =>
                  new InheritedWidgetTestContainer(),
              local_const.BLOC_FIRST_PAGE: (BuildContext context) =>
                  new FirstPage(),
              local_const.LEARN_OVERLAY: (BuildContext context) =>
                  new LearnOverlay(),
              local_const.LEARN_KEYS_ENTRANCE: (BuildContext context) =>
                  new KeysEntrance(),
              local_const.LEARN_KEYS_STATELESS_OK: (BuildContext context) =>
                  new PositionedTiles(),
              local_const.LEARN_KEYS_STATEFULL_NOT_OK: (BuildContext context) =>
                  new PositionedTilesNotWrok(),
              local_const.LEARN_KEYS_STATEFULL_OK: (BuildContext context) =>
                  new PositionedTilesStateFullWrok(),
              local_const.LEARN_KEYS_STATEFULL_RANDOM: (BuildContext context) =>
              new PositionedTilesStateFullRandom(),
            }));
  }
}
