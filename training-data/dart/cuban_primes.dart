bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

Iterable<int> cuban() sync* {
  for (var y = 1;; y++) {
    final p = 3 * y * y + 3 * y + 1;
    if (isPrime(p)) yield p;
  }
}

void main() => print(cuban().take(8).toList());
