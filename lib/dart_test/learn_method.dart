void main() {
//  _printHello("hello", age: 10, address: "beijing");
//  _printString("xsf", "shanghai");
  testCall.call(3);
  testCall(3);

  List<int> numbers = [3, 1, 2, 7, 12, 2, 4];
  print(numbers.reduce((prev, curr) {
    //闭包简写形式
    return prev + curr;
  }));
  numbers.forEach((item) {
    print(item);
  });
  print(numbers.reduce((prev, curr) => prev + curr)); //等价于上述形式，箭头函数简写形式
}

//test call
void testCall(int x) => print(x);
//

//可选参数

//可选命名参数

_printHello(name, {int age, String address}) {}

//可选位置参数

_printString([String name, String address, int age = 7]) {}
