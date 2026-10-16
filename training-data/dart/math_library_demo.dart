import 'dart:math';

void main() {
  print(sqrt(144));
  print(pow(2, 10));
  print(max(3, 8));
  print(min(2.5, 1.5));
  print((pi * 100).round() / 100);
  print(sin(pi / 2));
  print(log(e));
  final r = Random(7);
  print(List.generate(5, (_) => r.nextInt(10)));
}
