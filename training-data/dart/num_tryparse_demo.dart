void main() {
  print(int.parse('42'));
  print(double.parse('3.5'));
  print(int.tryParse('abc'));
  print(int.tryParse('ff', radix: 16));
  print(double.tryParse('1e3'));
  print(num.tryParse('7') is int);

  final inputs = ['10', 'x', '25', ''];
  final total = inputs.map(int.tryParse).whereType<int>().fold(0, (a, b) => a + b);
  print(total);

  try {
    int.parse('nope');
  } on FormatException catch (e) {
    print('bad input: ${e.message}');
  }
}
