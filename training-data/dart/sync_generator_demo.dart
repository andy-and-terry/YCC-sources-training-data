Iterable<int> fibonacci(int count) sync* {
  var a = 0, b = 1;
  for (var i = 0; i < count; i++) {
    yield a;
    final next = a + b;
    a = b;
    b = next;
  }
}

void main() {
  final values = fibonacci(10).toList();
  print(values);

  final evenOnly = fibonacci(10).where((n) => n % 2 == 0);
  print(evenOnly.toList());
}
