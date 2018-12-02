import 'package:flutter/material.dart';
import 'package:learnflutter/demo1/model/News.dart';

enum _Block {
  bg,
  text,
}

class NewsItem extends StatelessWidget {
  final News news;
  final bool enabled;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPresss;

  final bool selected;

  const NewsItem(
      {Key key,
      this.news,
      this.enabled: true,
      this.onTap,
      this.onLongPresss,
      this.selected: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    //获取全局theme
    TextTheme textTheme = Theme.of(context).textTheme;

    //background img
    children.add(LayoutId(
        id: _Block.bg,
        child: FadeInImage.assetNetwork(
            placeholder: 'images/news_cover.png',
            fit: BoxFit.fitWidth,
            image: '${news.urlToImage}')));
    children.add(LayoutId(
        id: _Block.text,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
          decoration: BoxDecoration(color: Colors.black38),
          child: Column(
            children: <Widget>[
              Text(
                '${news.title}',
                maxLines: 2,
                softWrap: true,
                style: textTheme.display1
                    .copyWith(color: Colors.white, fontSize: 18.0),
                overflow: TextOverflow.ellipsis,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '-${news.source?.name ?? 'unkown'}',
                  style: textTheme.body1.copyWith(
                      color: Colors.white70,
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        )));

    return new InkWell(
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPresss : null,
      child: Semantics(
        selected: selected,
        enabled: enabled,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 200.0, maxHeight: 200.0),
          child: CustomMultiChildLayout(
            delegate: ItemLayoutDelete(),
            children: children,
          ),
        ),
      ),
    );
  }
}

class ItemLayoutDelete extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild(_Block.bg)) {
      layoutChild(_Block.bg, BoxConstraints.tight(size));
      positionChild(_Block.bg, Offset.zero);
    }

    if (hasChild(_Block.text)) {
      layoutChild(_Block.text,
          BoxConstraints.tight(Size(size.width, size.height * 0.4)));
      positionChild(_Block.text, Offset(0.0, size.height * 0.6));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
