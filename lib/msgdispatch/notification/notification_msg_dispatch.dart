import 'package:flutter/material.dart';
import 'package:learnflutter/msgdispatch//notification/notificationroute.dart';

class NotificationMsgDispatchMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Notification Msg DisPatch'),
        centerTitle: true,
      ),
      body: NotificationStudy(),
    );
  }
}
