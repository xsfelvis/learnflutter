import 'dart:async';

String data = "start";

main() {
//  featureDelay();
//  create();
//  print("main end");
//=======
//  _startMethod();
//  _method_C();
  streamtest();
}

void featureDelay() {
  print("featureDelay start");

  Future.delayed(Duration(seconds: 3), () {
    print("this is a delay test");
  });
  print("featureDelay end");
}

void create() {
  getData();
  print("I love Future");
}

getData() async {
  data = await Future.delayed(Duration(seconds: 3), () {
    print("getData wait print");
    return "getData wait done";
  });
  print(data);
}

//==========

//当使用async作为方法名后缀声明时，说明这个方法的返回值是一个Future；
//当执行到该方法代码用await关键字标注时，会暂停该方法其他部分执行；
//当await关键字引用的Future执行完成，下一行代码会立即执行。

_startMethod() async {
  _method_A();
  await _method_B();
  print("start结束");
}

_method_A() {
  print("A开始执行这个方法~");
}

_method_B() async {
  print("B开始执行这个方法~");
  await print("后面执行这句话~");
  print("继续执行这句哈11111~");
}

_method_C() {
  print("C开始");
}

//stream

void streamtest() {
  Stream.fromFutures([
    //2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "Android";
    }),

    //3秒后抛出一个异常
    Future.delayed(new Duration(seconds: 3), () {
      return AssertionError("error");
    }),

    //4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return "Flutter";
    })
  ]).listen((result) {
    //打印接收的结果
    print(result);
  }, onError: (e) {
    //错误回调
    print(e.message);
  }, onDone: () {});
}
