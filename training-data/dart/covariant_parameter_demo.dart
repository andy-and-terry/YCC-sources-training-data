class Animal {
  String name;
  Animal(this.name);
}

class Cat extends Animal {
  Cat(super.name);
}

class Feeder {
  void feed(Animal animal) => print('feeding ${animal.name}');
}

class CatFeeder extends Feeder {
  @override
  void feed(covariant Cat animal) => print('feeding cat ${animal.name}');
}

void main() {
  final Feeder f = CatFeeder();
  f.feed(Cat('Tom'));
  try {
    f.feed(Animal('Rex'));
  } on TypeError {
    print('only cats allowed');
  }
}
