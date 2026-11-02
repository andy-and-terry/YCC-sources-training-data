mixin Swimmer {
  void swim() => print('$runtimeType swims');
}

class Animal {}
class Duck extends Animal with Swimmer {}

void main() => Duck().swim();
