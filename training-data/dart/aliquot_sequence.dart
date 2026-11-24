// Aliquot sequence: replace n by the sum of its proper divisors.
int aliquotSum(int n) {
  var s = 0;
  for (var d = 1; d <= n ~/ 2; d++) {
    if (n % d == 0) s += d;
  }
  return s;
}

void main() {
  final seq = [12];
  while (seq.last > 1 && seq.length < 20) {
    seq.add(aliquotSum(seq.last));
  }
  print(seq.join(' '));
}
