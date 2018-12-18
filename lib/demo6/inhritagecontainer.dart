import 'package:flutter/material.dart';
import 'package:learnflutter/demo6/dataInhritate.dart';
import 'package:learnflutter/demo6/datamodel.dart';
import 'package:learnflutter/demo6/funcationwidgets.dart';

class InheritedWidgetTestContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InheritedWidgetTestContainerState();
  }
}

class _InheritedWidgetTestContainerState
    extends State<InheritedWidgetTestContainer> {
  InheritedTestModel inheritedTestModel;

  _initData() {
    inheritedTestModel = new InheritedTestModel(0);
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _incrementCount() {
    setState(() {
      inheritedTestModel = new InheritedTestModel(inheritedTestModel.count + 1);
    });
  }

  _reduceCount() {
    setState(() {
      inheritedTestModel = new InheritedTestModel(inheritedTestModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedContext(
        inheritedTestModel: inheritedTestModel,
        increment: _incrementCount,
        reduce: _reduceCount,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('InheritedWidgetTest'),
          ),
          body: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: new Text('我们常使用的\nTheme.of(context).textTheme\nMediaQuery.of(context).size等\n就是通过InheritedWidget实现的',
                  style: new TextStyle(fontSize: 20.0),),
              ),
              new CustomerWidgetA(),
              new CustomerWidgetB(),
              new CustomerWidgetC(),
            ],
          ),
        ));
  }
}
