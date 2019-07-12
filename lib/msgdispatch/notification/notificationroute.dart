import 'package:flutter/material.dart';
import 'package:learnflutter/msgdispatch/notification/mynotification.dart';

class NotificationStudy extends StatefulWidget {
  @override
  NotificationStudyState createState() {
    return new NotificationStudyState();
  }
}

class NotificationStudyState extends State<NotificationStudy> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    //监听通知
    return Container(
      child: NotificationListener<CustomerNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//          RaisedButton(
//           onPressed: () => CustomerNotification("Hello NotificationStudy").dispatch(context),
//           child: Text("Send Notification"),
//          ),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    //按钮点击时分发通知
                    onPressed: () =>
                        CustomerNotification("Hello NotificationStudy")
                            .dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}
