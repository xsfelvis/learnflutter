import 'package:flutter/material.dart';
//接收参数的路由
class DynamicRoute extends StatelessWidget {
  DynamicRoute(this.tip);
  final String tip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dynamic route"),
      ),
      body: Center(
        child: Column(
            children:<Widget>[
              Text(tip),
              new RaisedButton(
                child: new Text("点我返回"),
                onPressed: () {
//                  Navigator.of(context).pop();
                  Navigator.of(context).pop("我是来自dymamic 关闭的返回值");
                },
                color: Colors.blue,
                highlightColor: Colors.lightBlue,
              )

            ]

        )
      ),
    );
  }
}