void main() {
  print(int.parse('42'));
  print(int.tryParse('4x2'));
  print(int.parse('ff', radix: 16));
  print(double.parse('3.5e2'));
  print(num.tryParse('7.0'));
  try {
    int.parse('abc');
  } on FormatException catch (e) {
    print('bad input: ${e.source}');
  }
  print((7 / 2).floor());
  print(7 ~/ 2);
  print((-7) % 3);
  print((-7).remainder(3));
}
