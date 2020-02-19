import 'package:flutter/material.dart';
import 'package:learnflutter/local_const.dart';

class KeysEntrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Msg DisPatch'),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('stateless ok'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, LocalConst.LEARN_KEYS_STATELESS_OK);
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('statefull not work'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, LocalConst.LEARN_KEYS_STATEFULL_NOT_OK);
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('statefull work'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, LocalConst.LEARN_KEYS_STATEFULL_OK);
                }),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: new RaisedButton(
                textColor: Colors.black,
                child: new Text('statefull random'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, LocalConst.LEARN_KEYS_STATEFULL_RANDOM);
                }),
          ),
        ],
      ),
    );
  }
}
