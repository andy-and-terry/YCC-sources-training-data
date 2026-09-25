enum Classification { perfect, abundant, deficient }

int aliquotSum(int n) {
  if (n == 1) return 0;
  var sum = 1;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      sum += i;
      if (i != n ~/ i) sum += n ~/ i;
    }
  }
  return sum;
}

Classification classify(int n) {
  final s = aliquotSum(n);
  if (s == n) return Classification.perfect;
  return s > n ? Classification.abundant : Classification.deficient;
}

void main() {
  for (final n in [6, 12, 28, 13, 8128]) {
    print('$n ${classify(n).name}');
  }
}
