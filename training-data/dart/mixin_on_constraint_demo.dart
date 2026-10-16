abstract class Animal {
  String get name;
}

mixin Swimmer on Animal {
  String swim() => '$name swims';
}

mixin Flyer on Animal {
  String fly() => '$name flies';
}

class Duck extends Animal with Swimmer, Flyer {
  @override
  String get name => 'Duck';
}

void main() {
  final d = Duck();
  print(d.swim());
  print(d.fly());
}
