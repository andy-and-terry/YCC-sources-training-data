int cubeFromOdds(int n) {
  final start = n * n - n + 1;
  var sum = 0;
  for (var i = 0; i < n; i++) {
    sum += start + 2 * i;
  }
  return sum;
}

void main() {
  for (var n = 1; n <= 5; n++) {
    print('$n ${cubeFromOdds(n)} ${cubeFromOdds(n) == n * n * n}');
  }
}
