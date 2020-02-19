import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnflutter/util/layoututil.dart';

class PositionedTilesStateFullWrok extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTilesStateFullWrok> {
  List<Widget> tiles = [StatefulColorfulTile(key:UniqueKey()), StatefulColorfulTile(key:UniqueKey())];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key}) : super(key: key);  // NEW CONSTRUCTOR

  @override
  ColorfulTileState createState() => ColorfulTileState();
}

class ColorfulTileState extends State<StatefulColorfulTile> {
  Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = randomARGB();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}
