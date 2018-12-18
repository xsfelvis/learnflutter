import 'package:flutter/material.dart';
import 'package:learnflutter/demo4/dynamic_router.dart';
import 'package:learnflutter/demo4/static_router.dart';

class Demo4Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: {
        "router/static_page": (context) => StaticRoute(),
      },
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            ParentStateMangeWidget(),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            HybridStateManage(),
            FlatButton(
              child: Text("open static router"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "router/static_page");
//                Navigator.of(context).pushNamed("router/static_page");
              },
            ),
            FlatButton(
              child: Text("open dynamic router"),
              textColor: Colors.blue,
              onPressed: () {
                Future future = Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return new DynamicRoute("传入跳转参数");
                }));
                //接收动态页面返回时传回的值
                future.then((value) {
                  showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text(value),
                      ));
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
