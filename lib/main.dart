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
import 'package:learnflutter/statemanager/learn_state.dart';
import 'package:learnflutter/statemanager/provider_simple.dart';
import 'package:learnflutter/statemanager/stream_simple.dart';
import 'package:learnflutter/widget/learn_slider.dart';
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
              LocalConst.ROUTE_PAGE: (BuildContext context) =>
                  new RouterStudy(),
              LocalConst.STATIC_ROUTE_PAGE: (context) => StaticRoute(),
              LocalConst.DIO_PAGE: (BuildContext context) => new DioStudy(),
              LocalConst.MSG_DISPATCH_PAGE: (BuildContext context) =>
                  new MsgDispatchMsg(),
              LocalConst.NOTIFICATION_DISPATCH_PAGE: (BuildContext context) =>
                  new NotificationMsgDispatchMsg(),
              LocalConst.INHRITED_DISPATCH_PAGE: (BuildContext context) =>
                  new InheritedWidgetTestContainer(),
              LocalConst.BLOC_FIRST_PAGE: (BuildContext context) =>
                  new FirstPage(),
              LocalConst.LEARN_OVERLAY: (BuildContext context) =>
                  new LearnOverlay(),
              LocalConst.LEARN_KEYS_ENTRANCE: (BuildContext context) =>
                  new KeysEntrance(),
              LocalConst.LEARN_KEYS_STATELESS_OK: (BuildContext context) =>
                  new PositionedTiles(),
              LocalConst.LEARN_KEYS_STATEFULL_NOT_OK: (BuildContext context) =>
                  new PositionedTilesNotWrok(),
              LocalConst.LEARN_KEYS_STATEFULL_OK: (BuildContext context) =>
                  new PositionedTilesStateFullWrok(),
              LocalConst.LEARN_KEYS_STATEFULL_RANDOM: (BuildContext context) =>
                  new PositionedTilesStateFullRandom(),
              LocalConst.LEARN_WIDGET_SLIDER: (BuildContext context) =>
                  new SliderDemo(),
              LocalConst.LEARN_STATE_MANAGER_ENTRANCE: (BuildContext context) =>
                  new LearnStateManager(),
              LocalConst.LEARN_STATE_MANAGER_STREAM_SIMPLE:
                  (BuildContext context) => new StreamSimpleCounterPage(),
              LocalConst.LEARN_STATE_SIMPLE_PROVIDER:
                  (BuildContext context) => new SimpleProvider(),
            }));
  }
}
