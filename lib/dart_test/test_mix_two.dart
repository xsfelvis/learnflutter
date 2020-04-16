typedef LoggerOutputFunction = void Function();

class OutModel with InModel {
  LoggerOutputFunction printTest = () {
    print("testA");
  };
}

mixin InModel {
  LoggerOutputFunction printTest = () {
    print("testB");
  };
}

main() {
  OutModel outModel = OutModel();
  outModel.printTest();
}
