import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class BatteryLevelMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new BatteryLevelWidget(),
    );
  }
}


class BatteryLevelWidget extends StatefulWidget {
  @override
  _BatteryLevelWidgetState createState() => new _BatteryLevelWidgetState();
}

class _BatteryLevelWidgetState extends State<BatteryLevelWidget> {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  //get battery level
  String _batteryLevel = 'Unknown battery level';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new RaisedButton(
              child: new Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
