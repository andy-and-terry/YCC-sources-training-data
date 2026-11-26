// Primorials up to 1e6, including 1; expect 8.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

void main() {
  final values = <int>[1];
  var acc = 1;
  for (var p = 2;; p++) {
    if (!isPrime(p)) continue;
    acc *= p;
    if (acc > 1000000) break;
    values.add(acc);
  }
  print('${values.length} $values');
}
