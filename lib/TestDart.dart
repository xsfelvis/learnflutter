import 'dart:async';

main() {
//  testFuture();
  test2();
}

Future test2() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

methodA() {
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future(() {
    // <== 该代码将在未来的某个时间段执行
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}

void testFuture() {
  Future f1 = new Future(() => print('f1'));
  Future f2 = new Future(() => null);
  Future f3 = new Future.delayed(Duration(seconds: 1), () => print('f2'));
  Future f4 = new Future(() => null);
  Future f5 = new Future(() => null);

  f5.then((_) => print('f3'));
  f4.then((_) {
    print('f4');
    new Future(() => print('f5'));
    f2.then((_) {
      print('f6');
    });
  });
  f2.then((m) {
    print('f7');
  });
  print('f8');
}
