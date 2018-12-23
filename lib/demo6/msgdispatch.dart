import 'package:flutter/material.dart';
import 'package:learnflutter/demo6/notification/notificationroute.dart';

class NotificationDispatchMsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Msg DisPatch'),
        centerTitle: true,
      ),
      body: NotificationStudy(),
    );
  }
}
