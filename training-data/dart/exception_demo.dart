class DivisionByZeroException implements Exception {
  final String message;
  DivisionByZeroException(this.message);
}

int safeDivide(int a, int b) {
  if (b == 0) throw DivisionByZeroException('cannot divide by zero');
  return a ~/ b;
}

void main() {
  print(safeDivide(10, 2));
  try {
    print(safeDivide(5, 0));
  } on DivisionByZeroException catch (e) {
    print('error: ${e.message}');
  }
}
