mixin Swimmer { void swim() => print('swimming'); }
mixin Walker { void walk() => print('walking'); }
class Duck with Swimmer, Walker {}

void main() => Duck()..swim()..walk();
