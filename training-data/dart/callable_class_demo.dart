class Multiplier {
  final int factor;
  const Multiplier(this.factor);

  int call(int x) => x * factor;
}

class Counter {
  int _n = 0;
  int call() => ++_n;
}

void main() {
  const triple = Multiplier(3);
  print(triple(5));
  print([1, 2, 3].map(triple).toList());

  final next = Counter();
  next();
  next();
  print(next());

  Function f = triple;
  print(f(10));
}
