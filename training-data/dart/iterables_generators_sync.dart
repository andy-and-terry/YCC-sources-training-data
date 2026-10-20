Iterable<int> naturals() sync* {
  var n = 0;
  while (true) { yield n++; }
}

Iterable<int> fibs() sync* {
  var a = 0, b = 1;
  while (true) { yield a; (a, b) = (b, a + b); }
}

Iterable<T> flatten<T>(Iterable<Iterable<T>> xs) sync* {
  for (var x in xs) { yield* x; }
}

class Countdown extends Iterable<int> {
  final int from;
  Countdown(this.from);
  @override
  Iterator<int> get iterator => _It(from);
}
class _It implements Iterator<int> {
  int _n;
  _It(this._n);
  @override
  int get current => _n + 1;
  @override
  bool moveNext() => --_n >= 0;
}

void main() {
  print(naturals().where((n) => n.isEven).take(5).toList());
  print(fibs().take(10).toList());
  print(flatten([[1, 2], [3], <int>[]]).toList());
  print(Countdown(4).toList());
  print(fibs().skipWhile((n) => n < 20).first);
  print(naturals().map((n) => n * n).takeWhile((n) => n < 50).length);
}
