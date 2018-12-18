import 'package:flutter/material.dart';
import 'package:learnflutter/demo6/test/inheritdata.dart';

class MyNestedChild extends StatelessWidget {

  TextStyle subtitleStyle =
  new TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);

  @override
  build(BuildContext context) {
    final MyWelcomeInfo widget =
        context.inheritFromWidgetOfExactType(MyWelcomeInfo);
    return Center(
//      color: Colors.greenAccent,
      child: new Text(
        widget.welcomeInfo,
        style: subtitleStyle,
      ),
    );
  }
}
