String scream(int length) => "A${'a' * length}h!";

main() {
  bool isInit;
  String testStr="ssss";
  final values = [1, 2, 3, 5, 10, 50];
  values.map(scream).forEach(print);
  print(isInit??testStr);
  print(isInit);
}