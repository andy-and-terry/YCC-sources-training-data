abstract class Animal {
  String get name;
}

mixin Swimmer on Animal {
  String swim() => '$name swims';
}

class Duck extends Animal with Swimmer {
  @override
  String get name => 'Duck';
}

void main() => print(Duck().swim());
