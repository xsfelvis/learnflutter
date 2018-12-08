import 'package:flutter/material.dart';
import 'package:learnflutter/demo2/utils/toast/ToastUtil.dart';
import 'package:learnflutter/demo3/model/Banners.dart';

class WidgetsUtils {
  // 屏幕宽度
  double screenWidth;

  WidgetsUtils(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
  }

  double getScreenWidth(){
    return screenWidth;
  }

  // 获取appBar
  Widget getAppBar(var title) {
    return new Text(title, style: new TextStyle(color: Colors.white));
  }

}
