// Square of the sum minus sum of squares for 1..10 (expect 2640)
void main() {
  final xs = List<int>.generate(10, (i) => i + 1);
  final sum = xs.reduce((a, b) => a + b);
  final squares = xs.fold<int>(0, (acc, x) => acc + x * x);
  print(sum * sum - squares);
}
