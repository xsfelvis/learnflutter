import 'dart:async';
import 'package:flutter/material.dart';

class StreamSimpleCounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StreamSimpleCounterPageState();
}

class _StreamSimpleCounterPageState extends State<StreamSimpleCounterPage> {
  int _counter = 0;
  final StreamController<int> _streamController = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stream Simple")),
      body: Center(
        child: StreamBuilder<int>(
          stream: _streamController.stream,
          initialData: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('You hit me: ${snapshot.data} times');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _streamController.sink.add(++_counter);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
}
