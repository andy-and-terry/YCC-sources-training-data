class Adder {
  final int n;
  Adder(this.n);
  int call(int x) => x + n;
}

class Greeter {
  String greet(String name) => 'Hello, $name';
}

int twice(int Function(int) f, int x) => f(f(x));

void main() {
  var add5 = Adder(5);
  print(add5(10));
  print(twice(add5, 1));
  var g = Greeter().greet;
  print(['a', 'b'].map(g).toList());
  print([3, 1, 2].map(add5.call).toList());
  var parse = int.parse;
  print(['1', '2'].map(parse).toList());
  Function f = (int a, int b) => a * b;
  print(Function.apply(f, [3, 4]));
  void Function(String) printer = print;
  printer('tearoff');
  var counter = () { var c = 0; return () => ++c; }();
  counter(); counter();
  print(counter());
  print((int x, {int y = 2, required int z}) => x + y + z);
  int named({int a = 1, int b = 2}) => a * 10 + b;
  print(named(b: 5));
}
