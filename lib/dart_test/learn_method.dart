void main() {
  _printHello("hello", age: 10, address: "beijing");
  _printString("xsf", "shanghai");
}

//可选参数

//可选命名参数

_printHello(name, {int age, String address}) {}

//可选位置参数

_printString([String name, String address, int age = 7]) {}
