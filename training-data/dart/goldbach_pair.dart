// Goldbach pair using a record (Dart 3).
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

(int, int)? goldbach(int n) {
  for (var p = 2; p <= n ~/ 2; p++) {
    if (isPrime(p) && isPrime(n - p)) return (p, n - p);
  }
  return null;
}

void main() => print(goldbach(28));
