import 'package:flutter/material.dart';

class MsgDispatchMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Msg DisPatch'),
        centerTitle: true,
      ),
      body:new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('InheritedWidget从上往下传递数据'),
                onPressed: () {
                  Navigator.pushNamed(context, "MsgPatchMsgPage/InhritedWidgetDisPatchMsgPage");
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('Notification从下往上数据传递'),
                onPressed: () {
                  Navigator.pushNamed(context, "MsgPatchMsgPage/NotificationDisPatchMsgPage");
                }),
          ),

          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('EventBus 使用'),
                onPressed: () {
//                  Navigator.pushNamed(context, "/GlobalKeyFromPage");
                }),
          ),
        ],
      ) ,
    );
  }
}
