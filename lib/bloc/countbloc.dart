import 'dart:async';

class CountBloc {
  int _count;
  StreamController<int> _countController;

  CountBloc() {
    _count = 0;
    _countController = StreamController<int>.broadcast();
  }

  Stream<int> get value => _countController.stream;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }
}
