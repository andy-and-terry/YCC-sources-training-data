class Greeter {
  final String greeting;
  Greeter(this.greeting);
  String greet(String name) => '$greeting, $name!';
}

void main() {
  final g = Greeter('Hello');
  final fn = g.greet;
  print(['Ann', 'Bo'].map(fn).toList());
  print(['1', '2', '3'].map(int.parse).toList());
  final ctor = Greeter.new;
  print(ctor('Hi').greet('there'));
}
