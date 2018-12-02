import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:learnflutter/demo1/model/news.dart';
import 'package:learnflutter/demo1/widgets/loading_footer.dart';
import 'package:learnflutter/demo1/request/news_api.dart';
import 'package:learnflutter/demo1/widgets/news_item.dart';

class HeadLineList extends StatefulWidget {
  final String _category;

  HeadLineList(this._category);

  @override
  _HeadlineListState createState() => _HeadlineListState();
}

class _HeadlineListState extends State<HeadLineList>
    with AutomaticKeepAliveClientMixin {
  static const int IDLE = 0;
  static const int LOADING = 1;
  static const int ERROR = 3;
  static const int EMPTY = 4;
  int _status = IDLE;
  int _pageCount = 0;
  String _message;
  int _footStatus = LoadingFooter.IDLE;
  double _lastOffset = 0.0;
  List<News> _articles;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  Completer<Null> _completer;

  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _status = LOADING;
    _controller = ScrollController();
    _controller.addListener(_updateScrollPositionListener);
    //底部加载此时还会拉取列表不太合理
    _getNews();
  }

  @override
  void dispose() {
    _controller.removeListener(_updateScrollPositionListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_status) {
      case IDLE:
        //没有数据
        return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
              itemCount: _articles.length + 1,
              itemBuilder: (context, index) {
                if (index == _articles.length) {
                  //展示加载更多按钮
                  return LoadingFooter(
                      retry: () {
                        _loadMore();
                      },
                      state: _footStatus);
                } else {
                  //构建正常的Item
                  return NewsItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebviewScaffold(
                                      url: '${_articles[index].url}',
                                      appBar:
                                          AppBar(title: Text("新闻详情")),
                                    )));
                      },
                      news: _articles[index]);
                }
              },
              controller: _controller,
            ));

      case LOADING:
        return Center(child: CircularProgressIndicator());
      case ERROR:
        return Center(
          child: Text(_message ??
              "Something is wrong, you might need to reboot your phone."),
        );
      case EMPTY:
        return Center(child: Text("No news is good news!"));
      default:
        return Center(child: Text("Something terrible happen~"));
    }
  }

//  这样就能一直保持当前不被initState了
  @override
  bool get wantKeepAlive => true;

  Future _getNews() async {
    _pageCount = 0;
    NewsList news = await NewsApi.getHeadlines(category: widget._category);
    if (!mounted) {
      return;
    }
    _articles = news?.articles;
    if (_completer != null) {
      _completer.complete();
      _completer = null;
    }
    //有了数据触发UI更新
    setState(() {
      if ("ok".compareTo(news?.status) != 0) {
        _status = ERROR;
        _message = news?.message;
      } else if (_articles?.isEmpty ?? false) {
        _status = EMPTY;
      } else {
        _pageCount++;
        _status = IDLE;
      }
    });
  }

  void _updateScrollPositionListener() {
    bool isBottom =
//        (_controller.position.maxScrollExtent == _controller.position.pixels);
    _controller.position.maxScrollExtent - _controller.offset < 100;

    if (_footStatus == LoadingFooter.IDLE &&
        _controller.offset > _lastOffset &&
        //这个有待确认这个下来
        isBottom) {
      _loadMore();
    }
    _lastOffset = _controller.offset;
  }

//底部加载更多
  Future _loadMore() async {
    setState(() {
      _footStatus = LoadingFooter.LOADING;
    });
    NewsList news = await NewsApi.getHeadlines(
        page: _pageCount, category: widget._category);
    if (!mounted) {
      return;
    }
    setState(() {
      if (news?.articles?.isNotEmpty ?? false) {
        _pageCount++;
      }
      _articles.addAll(news?.articles);
      _footStatus = LoadingFooter.IDLE;
    });
  }

  //下拉刷新
  Future<void> _onRefresh() {
    _completer = new Completer();
    _getNews();
    return _completer.future;
  }
}
