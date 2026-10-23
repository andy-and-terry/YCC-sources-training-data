abstract class Animal {
  String get name;
}

mixin Swimmer on Animal {
  void swim() => print('$name swims');
}

class Duck extends Animal with Swimmer {
  @override
  String get name => 'Duck';
}

void main() {
  Duck().swim();
}
