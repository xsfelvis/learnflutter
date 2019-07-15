import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CountBloc {
  int _count;
  StreamController<int> _countController;

  CountBloc() {
    _count = 0;
//    _countController = StreamController<int>.broadcast();
    //BehaviorSubject可以记录下最新一次的事件
    _countController = BehaviorSubject<int>();
  }

  Stream<int> get value => _countController.stream;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}
