import 'package:flutter/material.dart';
import 'local_const.dart';

class DrawerWeiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DrawerWeigetState();
  }
}

class _DrawerWeigetState extends State<DrawerWeiget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      padding: const EdgeInsets.only(),
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text('渡口一艘船'),
          accountEmail: new Text('XXXXXXXXXXX'),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new AssetImage('images/ic_avator.png'),
//            backgroundImage: new NetworkImage(
//                'https://github.com/account'),
          ),
        ),
        new ListTile(
            title: new Text('路由'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, local_const.ROUTE_PAGE);
            }),
        new Divider(),
        new ListTile(
            title: new Text('dio+json_serial网络解析'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, local_const.DIO_PAGE);
            }),
        new Divider(),
        new ListTile(
            title: new Text('Flutter的传递消息传递'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, local_const.MSG_DISPATCH_PAGE);
            }),
        new Divider(),
        new ListTile(
          title: new Text('Bloc'),
          trailing: new Icon(Icons.arrow_right),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, local_const.BLOC_FIRST_PAGE);
          },
        ),
        new Divider(),
        new ListTile(
          title: new Text('overlay'),
          trailing: new Icon(Icons.arrow_right),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, local_const.LEARN_OVERLAY);
          },
        ),
        new Divider(),
        new ListTile(
          title: new Text('keys'),
          trailing: new Icon(Icons.arrow_right),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, local_const.LEARN_KEYS_ENTRANCE);
          },
        )
      ],
    );
  }
}

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DrawerWeiget(),
    );
  }
}
