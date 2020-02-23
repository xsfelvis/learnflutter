import 'dart:async';

main(List<String> arguments) {
  print(genList());
  print(genList2());
}

//同步
Iterable<int> genList({int max = 10}) sync* {
  var i = 0;
  while (i < max) {
    yield i;
    i++;
  }
}

Iterable<int> genList2({int max = 10}) {
  var list = <int>[];
  var i = 0;
  while (i < max) {
    list.add(i);
    i++;
  }
  return list.map((i) => i);
}

//异步
Stream<int> genStream({int max = 10}) async* {
  int i = 0;
  while (i < max) {
    yield i;
    await Future.delayed(Duration(milliseconds: 300));
    
  }
}
