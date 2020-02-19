abstract class Animal {
  int eye = 2;

  //抽象类
  eat(); //抽象方法
  run(); //抽象方法
  printInfo() {
    print('我是一个抽象类里面的普通方法');
  }
}

class Dog extends Animal {
  @override
  eat() {
    // TODO: implement eat
    return null;
  }

  @override
  run() {
    // TODO: implement run
    return null;
  }
}

class Fly implements Animal {
  @override
  int eye;

  @override
  eat() {
    // TODO: implement eat
    return null;
  }

  @override
  printInfo() {
    // TODO: implement printInfo
    return null;
  }

  @override
  run() {
    // TODO: implement run
    return null;
  }
}

abstract class ColorMix {
  _colorIn() {}
}

abstract class Plant {
  Plant();

  _sun() {}
}

class _SuperGaint = Plant with ColorMix;
