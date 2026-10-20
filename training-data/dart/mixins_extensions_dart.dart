mixin Walker {
  void walk() => print('$name walks');
  String get name;
}

mixin Swimmer on Walker {
  void swim() => print('$name swims');
}

class Animal { final String name; Animal(this.name); }
class Duck extends Animal with Walker, Swimmer {
  Duck(super.name);
}

extension StringX on String {
  String get shout => '${toUpperCase()}!';
  bool get isPalindrome { final c = toLowerCase(); return c == c.split('').reversed.join(); }
}

extension NumX<T extends num> on List<T> {
  T get total => reduce((a, b) => (a + b) as T);
}

void main() {
  var d = Duck('Donald');
  d.walk();
  d.swim();
  print('hi'.shout + ' ${"Racecar".isPalindrome}');
  print([1, 2, 3].total);
}
