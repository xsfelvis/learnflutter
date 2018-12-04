import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learnflutter/demo2/utils/WidgetsUtils.dart';
import 'package:learnflutter/demo2/utils/net/Api.dart';
import 'package:learnflutter/demo2/utils/net/Http.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:banner_view/banner_view.dart';
import 'package:learnflutter/demo2/utils/toast/ToastUtil.dart';

class NewsListPage extends StatefulWidget {
  @override
  NewsListPageState createState() => new NewsListPageState();
}

class NewsListPageState extends State<NewsListPage> {
  //轮播图的数据
  var slideData = [];

  //列表的数据
  var listData = [];

  //总数
  var listTotalSize;

  //列表中资讯标题的样式
  TextStyle titleTextStyle = new TextStyle(fontSize: 15.0);

  //时间样式
  TextStyle subtitleStyle =
      new TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);

  //作者style
  TextStyle authorStyle =
      new TextStyle(color: const Color(0xFF000000), fontSize: 12.0);

  //分页
  var _mCurPage = 0;

  WidgetsUtils mWidgetUtils;

  @override
  void initState() {
    super.initState();
    getNewsList(_mCurPage);
    getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    mWidgetUtils = new WidgetsUtils(context);
    if (listData.length == 0) {
      return new Center(
        child: new CircularProgressIndicator(backgroundColor: Colors.green),
      );
    } else {
      return new Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: onHeaderRefresh,
        childBuilder: (BuildContext context,
            {ScrollController controller, ScrollPhysics physics}) {
          return new Container(
              child: new ListView.builder(
                  // 这里itemCount是将轮播图组件、分割线和列表items都作为ListView的item算了
                  itemCount: listData.length * 2 + 1,
                  controller: controller,
                  physics: physics,
                  itemBuilder: (context, i) => renderRow(i)));
        },
      );
    }
  }

  //  获取Banner数据
  void getNewsList(int curpage) {
    var url = Api.HOME_ARTICLE + curpage.toString() + "/json";
    Http.get(url).then((res) {
      try {
        Map<String, dynamic> map = jsonDecode(res);
        setState(() {
          var _listData = map['data']['datas'];
          if (curpage == 1) {
            listData.clear();
            listData.addAll(_listData);
          } else {
            listData.addAll(_listData);
          }
        });
      } catch (e) {
        print('错误 catch s $e');
      }
    });
  }

  //获取banner数据
  void getBannerList() {
    var url = Api.HOME_BANNER;
    Http.get(url).then((res) {
      try {
        Map<String, dynamic> map = json.decode(res);
        //更新状态
        setState(() {
          slideData = map['data'];
        });
      } catch (e) {
        print('错误catch s $e');
      }
    });
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _mCurPage++;
        getNewsList(_mCurPage);
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _mCurPage = 1;
        getBannerList();
        getNewsList(_mCurPage);
      });
    });
  }

  Widget renderRow(i) {
    // i为0时渲染轮播图
    if (i == 0) {
      if (slideData != null && slideData.length > 0) {
        return new Container(
          height: 180.0,
          child: new BannerView(
              mWidgetUtils.getBannerChild(context, slideData),
              intervalDuration: const Duration(seconds: 3),
              animationDuration: const Duration(milliseconds: 500)),
        );
      }
    }
    // i > 0时
    i -= 1;
    // i为奇数，渲染分割线
    if (i.isOdd) {
      return new Divider(height: 1.0);
    }
    // 将i取整
    i = i ~/ 2;
    // 得到列表item的数据
    var itemData = listData[i];

//    标题行
    var titleRow = new Row(
      children: <Widget>[
        // 标题充满一整行，所以用Expanded组件包裹
        new Expanded(
          child: new Text(itemData['title'], style: titleTextStyle),
        )
      ],
    );
    // 时间这一行包含了作者头像、时间、评论数这几个
    var timeRow = new Row(
      children: <Widget>[
        new Container(
          child: new Text(
            itemData['superChapterName'],
            style: subtitleStyle,
          ),
        ),
        // 这是时间文本
        new Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
          child: new Text(
            itemData['niceDate'],
            style: subtitleStyle,
          ),
        ),
        // 这是评论数，评论数由一个评论图标和具体的评论数构成，所以是一个Row组件
        new Expanded(
          flex: 1,
          child: new Row(
            // 为了让评论数显示在最右侧，所以需要外面的Expanded和这里的MainAxisAlignment.end
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text("${itemData['zan']}", style: subtitleStyle),
              new Padding(
                padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                child: new Image.asset(
                    itemData['collect']
                        ? './images/ic_is_like.png'
                        : './images/ic_un_like.png',
                    width: 16.0,
                    height: 16.0),
              )
            ],
          ),
        )
      ],
    );
    var row = new Row(
      children: <Widget>[
        // 左边是标题，时间，评论数等信息
        new Expanded(
          flex: 1,
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 14.0,
                      height: 14.0,
                      child: new Image.asset('./images/author.png'),
                      margin: new EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),
                    ),
                    new Text(
                      '${itemData['author']}',
                      style: authorStyle,
                    )
                  ],
                ),
                new Container(
                  margin: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 6.0),
                  child: titleRow,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: timeRow,
                )
              ],
            ),
          ),
        ),
      ],
    );
    return new InkWell(
      child: row,
      onTap: () {
        ToastUtils.showShort("跳转详情页");
//        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//          return new NewsDetailPage(itemData['link'],itemData['title']);
//        }));
      },
    );
  }
}
