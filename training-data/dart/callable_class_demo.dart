class Multiplier {
  final int factor;
  const Multiplier(this.factor);

  int call(int value) => value * factor;
}

class Greeter {
  String call(String name, {String greeting = 'Hello'}) => '$greeting, $name!';
}

void main() {
  const triple = Multiplier(3);
  print(triple(14));

  final fns = <int Function(int)>[Multiplier(2), Multiplier(5), (x) => x + 1];
  print(fns.map((f) => f(10)).toList());

  print([1, 2, 3].map(triple).toList());

  final greet = Greeter();
  print(greet('Ada'));
  print(greet('Linus', greeting: 'Hi'));
  print(greet.call('Grace'));
}
