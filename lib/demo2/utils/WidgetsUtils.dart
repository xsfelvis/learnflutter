import 'package:flutter/material.dart';
import 'package:learnflutter/demo2/utils/toast/ToastUtil.dart';

class WidgetsUtils {
  // 屏幕宽度
  double screenWidth;

  WidgetsUtils(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
  }

  // 获取appBar
  Widget getAppBar(var title) {
    return new Text(title, style: new TextStyle(color: Colors.white));
  }

  // banner图片
  List<Widget> getBannerChild(BuildContext context, List slideData) {
    List<Widget> items = [];
    if (slideData != null && slideData.length > 0) {
      for (var i = 0; i < slideData.length; i++) {
        var item = slideData[i];
        var imgUrl = item['imagePath'];
        var title = item['title'];
        var detailUrl = item['url'];
        items.add(new GestureDetector(
          onTap: () {
            // 详情跳转
            ToastUtils.showShort("跳转详情页");
//            Navigator.of(context)
//                .push(new MaterialPageRoute(builder: (context) {
//              return new NewsDetailPage(detailUrl, title);
//            }));
          },
          child: new Stack(
            children: <Widget>[
              new Image.network(imgUrl),
              new Container(
                  width: screenWidth,
                  color: const Color(0x50000000),
                  child: new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(title,
                        maxLines: 1,
                        style:
                            new TextStyle(color: Colors.white, fontSize: 15.0)),
                  )),
            ],
          ),
        ));
      }
      return items;
    }
  }
}
