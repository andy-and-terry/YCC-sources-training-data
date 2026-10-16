int Function() makeCounter() {
  var count = 0;
  return () => ++count;
}

void main() {
  final a = makeCounter();
  final b = makeCounter();
  print(a());
  print(a());
  print(b());
  print(a());
}
