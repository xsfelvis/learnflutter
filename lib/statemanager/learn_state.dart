import 'package:flutter/material.dart';
import 'package:learnflutter/local_const.dart';

class LearnStateManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Learn State Manager'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('ScopeModel'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, LocalConst.INHRITED_DISPATCH_PAGE);
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Simple Stream'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, LocalConst.LEARN_STATE_MANAGER_STREAM_SIMPLE);
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('BLoC'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, LocalConst.NOTIFICATION_DISPATCH_PAGE);
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Wait ……'),
                onPressed: () {
//                  Navigator.pushNamed(context, "/GlobalKeyFromPage");
                }),
          ),
        ],
      ),
    );
  }
}
