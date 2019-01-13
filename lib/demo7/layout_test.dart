import 'package:flutter/material.dart';
import 'package:learnflutter/util/layoututil.dart';

////////////////////////-----------------测试1--------------------------------
var rowLine = Row(
  children: <Widget>[
    Icon(
      Icons.extension,
      color: Colors.blue,
    ),
    Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        "占位符号",
        style: TextStyle(fontSize: 18),
      ),
    )),
    Icon(Icons.arrow_forward)
  ],
);

var simpleview =
    Container(color: Colors.white, padding: EdgeInsets.all(15), child: rowLine);

////////////////////////-----------------测试2--------------------------------

//左边头像
var headImg = Image.asset(
  "images/icon_gql.jpg",
  width: 45,
  height: 45,
);

//中间的信息
var center2 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      "上善若水",
      style: commonStyle,
    ),
    Text(
      "天地不仁,以万物为刍狗",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: infoStyle,
      textAlign: TextAlign.start,
    )
  ],
);

//尾部的时间+图标
var end2 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(
      "08:53",
      style: infoStyle,
    ),
    Icon(
      Icons.visibility_off,
      size: 20,
      color: Color(0xff999999),
    )
  ],
);
//

var rowLine2 = Row(
  children: <Widget>[
    Padding(
      child: headImg,
      padding: EdgeInsets.all(5),
    ),
    Expanded(child: Padding(padding: EdgeInsets.all(5), child: center2)),
    end2
  ],
);

var simpletitle = Container(
    height: 70,
    color: Colors.white,
    padding: EdgeInsets.all(5),
    child: rowLine2);

////////////////////////-----------------测试3--------------------------------
//左边头像
var headImg3 = Image.asset(
  "images/ic_avator.png",
  width: 50,
  height: 50,
);
var headImg4 =
    ClipOval(child: Image.asset('images/ic_avator.png', width: 50, height: 50));

//中间的信息
var center3 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      "渡口一艘船",
      style: bigStyle,
    ),
    Row(
      children: <Widget>[
        Icon(Icons.next_week, size: 15),
        pd(Text("西溪九橙 | Android"), l: 5)
      ],
    ),
    Row(
      children: <Widget>[
        Icon(Icons.keyboard, size: 15),
        pd(
            Text(
              "路漫漫其修远兮,吾将上下而求索",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            l: 1)
      ],
    ),
  ],
);

//尾部的
var end3 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: <Widget>[
    Row(
      children: <Widget>[
        Icon(
          Icons.language,
          size: 15,
        ),
        Icon(Icons.local_pharmacy, size: 15),
        Icon(Icons.person_pin_circle, size: 15)
      ],
    ),
    bg(
        pdhv(
            Text(
              "编辑",
              style: btnStyle,
            ),
            h: 10,
            v: 3),
        Colors.blueAccent),
  ],
);
//

var rowLine3 = Row(
  children: <Widget>[
    pda(headImg3, 5),
    Expanded(child: pda(center3, 5)),
    pda(end3, 10),
  ],
);

var juejincard1 = Card(
    child: Container(
        height: 95,
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: rowLine3));

////////////////////////-----------------测试4--------------------------------
var line1_4 = Row(
  children: <Widget>[
    Image.asset("images/ic_avator.png", width: 20, height: 20),
    Expanded(
      child: pd(Text("渡口一艘船"), l: 5),
    ),
    Text(
      "Flutter/Dart",
      style: infoStyle,
    )
  ],
);

var center_right = Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Text(
      "Flutter基础控件深入学习",
      style: littelStyle,
      maxLines: 2,
    ),
    pd(
        Text(
          "测试文案,测试文案,测试文案,测试文案,测试文案,测试文案,测试文案,测试文案",
          style: infoStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        t: 5),
  ],
);

//中间的信息
var center4 = Row(
  children: <Widget>[
    Expanded(child: pda(center_right, 5)),
    Image.asset(
      "images/wy_300x200.jpg",
      width: 80,
      height: 80,
      fit: BoxFit.fitHeight,
    )
  ],
);

var end4 = Row(
  children: <Widget>[
    Icon(
      Icons.grade,
      color: Colors.green,
      size: 20,
    ),
    Text(
      "1000W",
      style: infoStyle,
    ),
    pd(Icon(Icons.tag_faces, color: Colors.lightBlueAccent, size: 20),
        l: 15, r: 5),
    Text("2000W", style: infoStyle),
  ],
);

var item4 = Column(
  children: <Widget>[line1_4, Expanded(child: center4), end4],
);

var junjincard2 = Card(
    child: Container(
        height: 160,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: item4));

//--------------------------------------------------------------------------
//竖直

var test5 = ListView.builder(
  itemCount: 30,
  itemBuilder: (context, index) {
    return Column(
      children: <Widget>[junjincard2],
    );
  },
);

var test6 = ListView.separated(
    itemBuilder: (ctx, i) {
      return Column(
        children: <Widget>[junjincard2],
      );
    },
    separatorBuilder: (ctx, i) {
      return Column(
        children: <Widget>[(i + 1) % 2 == 0 ? simpletitle : Container()],
      );
    },
    itemCount: 5);
