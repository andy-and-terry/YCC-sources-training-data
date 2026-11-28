import 'dart:math';

bool isPronic(int x) {
  final n = sqrt(x).floor();
  return n * (n + 1) == x;
}

void main() {
  print(List.generate(10, (n) => n * (n + 1))); // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
  print('${isPronic(56)} ${isPronic(57)}'); // true false
}
