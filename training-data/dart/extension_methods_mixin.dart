extension Shout on String {
  String get shout => '${toUpperCase()}!';
}

mixin Walker {
  String walk() => 'walking';
}

class Dog with Walker {}

void main() {
  print('hi'.shout);
  print(Dog().walk());
}
