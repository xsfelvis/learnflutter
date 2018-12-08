import 'package:flutter/material.dart';
import 'package:learnflutter/demo2/DebugConfig.dart';
import 'package:learnflutter/demo2/Demo2Main.dart';
import 'package:learnflutter/demo3/Demo3Main.dart';

//void main() => runApp(NewsApp());
void main() {
  DebugConfig.proxyPrort = 8888;
  DebugConfig.proxyIp = "172.23.235.153";

  runApp(Demo3Main());
}
