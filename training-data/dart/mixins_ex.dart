mixin Swimmer { void swim() => print('$runtimeType swims'); }
mixin Flyer { void fly() => print('$runtimeType flies'); }

class Animal {}
class Duck extends Animal with Swimmer, Flyer {}

void main() {
  Duck()..swim()..fly();
}
