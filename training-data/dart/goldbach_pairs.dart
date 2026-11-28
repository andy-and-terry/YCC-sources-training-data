bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

void main() {
  const n = 28;
  for (var p = 2; p <= n ~/ 2; p++) {
    if (isPrime(p) && isPrime(n - p)) print('$p + ${n - p}');
  }
}
