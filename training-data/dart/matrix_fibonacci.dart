typedef Mat = List<List<int>>;

Mat multiply(Mat a, Mat b) {
  final r = List.generate(2, (_) => List.filled(2, 0));
  for (var i = 0; i < 2; i++) {
    for (var j = 0; j < 2; j++) {
      for (var k = 0; k < 2; k++) {
        r[i][j] += a[i][k] * b[k][j];
      }
    }
  }
  return r;
}

int fib(int n) {
  var result = [
    [1, 0],
    [0, 1],
  ];
  var base = [
    [1, 1],
    [1, 0],
  ];
  while (n > 0) {
    if (n.isOdd) result = multiply(result, base);
    base = multiply(base, base);
    n >>= 1;
  }
  return result[0][1];
}

void main() {
  for (final n in [1, 10, 50, 90]) {
    print('fib($n) = ${fib(n)}');
  }
}
