class Multiplier {
  final int factor;
  const Multiplier(this.factor);

  int call(int value) => value * factor;
}

class Greeter {
  final String greeting;
  Greeter(this.greeting);

  String call(String name, {String punctuation = '!'}) =>
      '$greeting, $name$punctuation';
}

void main() {
  const triple = Multiplier(3);
  print(triple(14));
  print([1, 2, 3].map(triple).toList());

  final greet = Greeter('Hello');
  print(greet('Dart'));
  print(greet('World', punctuation: '?'));

  Function f = triple;
  print(f(5));
  print(triple is Function);
}
