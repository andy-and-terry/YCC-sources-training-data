mixin Flyable {
  String fly() => 'flying';
}

mixin Swimmable {
  String swim() => 'swimming';
}

class Duck with Flyable, Swimmable {
  String describe() => 'Duck is ${fly()} and ${swim()}';
}

void main() {
  print(Duck().describe());
}
