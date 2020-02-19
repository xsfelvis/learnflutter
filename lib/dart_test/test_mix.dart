class A {
  a() {
    print("A.a()");
  }

  b() {
    print("A.b()");
  }
}

class A2 {
  a() {
    print("A2.a()");
  }
}

class B {
  a() {
    print("B.a()");
  }

  b() {
    print("B.b()");
  }

  c() {
    print("B.c()");
  }
}

class G extends B with A, A2 {}

class G2 = B with A, A2;

//========== advanced ============

abstract class Base {
  a() {
    print("base a()");
  }

  b() {
    print("base b()");
  }

  c() {
    print("base c()");
  }
}

class C extends Base {
  a() {
    print("A.a()");
//    super.a();
  }

  b() {
    print("A.b()");
//    super.b();
  }
}

class C1 extends Base {
  a() {
    print("A2.a()");
    super.a();
  }
}

class D extends Base {
  a() {
    print("B.a()");
    super.a();
  }

  b() {
    print("B.b()");
    super.b();
  }

  c() {
    print("B.c()");
    super.c();
  }
}

class E = D with C, C1;

void main() {
  G t = new G();
  t.a();
  t.b();
  t.c();
  print("=========");
  G2 g2 = G2();
  g2.a();
  g2.b();
  g2.c();
  print("=========");
  E e = E();
  e.a();
  e.b();
  e.c();
}
