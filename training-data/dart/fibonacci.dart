List<int> fibonacci(int n) {
  final result = <int>[];
  var a = 0, b = 1;
  for (var i = 0; i < n; i++) {
    result.add(a);
    final temp = a + b;
    a = b;
    b = temp;
  }
  return result;
}

void main() {
  print(fibonacci(11));
}
