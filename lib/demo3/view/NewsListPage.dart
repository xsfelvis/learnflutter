import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learnflutter/demo3/model/Banners.dart';
import 'package:learnflutter/demo3/model/News.dart';
import 'package:learnflutter/demo3/model/UserInfoTest.dart';
import 'package:learnflutter/demo3/utils/WidgetsUtils.dart';
import 'package:learnflutter/demo3/utils/net/Api.dart';
import 'package:learnflutter/demo3/utils/net/Http.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:banner_view/banner_view.dart';
import 'package:learnflutter/demo3/utils/net/HttpBiz.dart';
import 'package:learnflutter/demo3/utils/net/HttpCore.dart';
import 'package:learnflutter/demo3/utils/toast/ToastUtil.dart';
import 'package:learnflutter/demo3/model/Banners.dart';

class NewsListPage extends StatefulWidget {
  @override
  NewsListPageState createState() => new NewsListPageState();
}

class NewsListPageState extends State<NewsListPage> {
  //轮播图的数据
  List<BannerData> slideData = [];

  //列表的数据
  List<Datas> listData = [];

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
    _getNewsList(_mCurPage);
    _getBannerList();
//    testRequest();
//    testRequest2();
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
        onFooterRefresh: _onFooterRefresh,
        onHeaderRefresh: _onHeaderRefresh,
        childBuilder: (BuildContext context,
            {ScrollController controller, ScrollPhysics physics}) {
          return new Container(
              child: new ListView.builder(
                  // 这里itemCount是将轮播图组件、分割线和列表items都作为ListView的item算了
                  itemCount: listData.length * 2 + 1,
                  controller: controller,
                  physics: physics,
                  itemBuilder: (context, i) => _renderRow(i)));
        },
      );
    }
  }



  Widget _renderRow(i) {
    // i为0时渲染轮播图
    if (i == 0) {
      if (slideData != null && slideData.length > 0) {
        return new Container(
          height: 200.0,
          child: _bannerView(),
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
          child: new Text(itemData.title, style: titleTextStyle),
        )
      ],
    );
    // 时间这一行包含了作者头像、时间、评论数这几个
    var timeRow = new Row(
      children: <Widget>[
        new Container(
          child: new Text(
            itemData.superChapterName,
            style: subtitleStyle,
          ),
        ),
        // 这是时间文本
        new Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
          child: new Text(
            itemData.niceDate,
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
              new Text("${itemData.zan}", style: subtitleStyle),
              new Padding(
                padding: new EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                child: new Image.asset(
                    itemData.collect
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
                      '${itemData.author}',
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

  Widget _bannerView (){
    return new BannerView(_getBannerChild(context, slideData),
        intervalDuration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 500));
  }

  List<Widget> _getBannerChild(BuildContext context, List<BannerData> slideData) {
    List<Widget> items = [];
    if (slideData != null && slideData.length > 0) {
      for (var i = 0; i < slideData.length; i++) {
        var item = slideData[i];
        var imgUrl = item.imagePath;
        var title = item.title;
        var detailUrl = item.url;
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
              new Image.network(imgUrl,fit:BoxFit.fitWidth),
              new Container(
                  width: mWidgetUtils.getScreenWidth(),
                  color: const Color(0x50000000),
                  child: new Padding(
                    padding: const EdgeInsets.all(1.0),
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


  //  获取Banner数据
  void _getNewsList(int curpage) {
    var url = Api.BASE_URL +Api.HOME_ARTICLE + curpage.toString() + "/json";
    HttpCore.instance.get(url, (data) {
      News news = News.fromJson(data);
      List<Datas> newsDatas = news.datas;
      setState(() {
        listData = newsDatas;
      });
    });
  }

  //获取banner数据
  Future _getBannerList() async {
//    List<BannerData> bannerdata = await HttpBiz.instance.getBannerItems();

    HttpCore.instance.get(Api.BASE_URL + Api.HOME_BANNER, (data) {
      List<BannerData> banners = getBannersList(data);
      setState(() {
        slideData = banners;
      });
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
      return null;
    });
  }

  Future<Null> _onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _mCurPage++;
        _getNewsList(_mCurPage);
      });
    });
  }

  Future<Null> _onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _mCurPage = 1;
        _getBannerList();
        _getNewsList(_mCurPage);
      });
    });
  }

  void _testRequest() {
    HttpCore.instance.get(Api.BASE_URL + Api.HOME_BANNER, (data) {
      ToastUtils.showShort("" + getBannersList(data)[0].desc);
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
    });
  }

  void _testRequest2() {
    HttpCore.instance.get("http://www.mocky.io/v2/5b7143ae3200001402f36c46",
        (data) {
      ToastUtils.showShort("" + UserInfo.fromJson(data).name);
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
    });
  }
}
