// Goldbach partitions of 100; expect 6.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

void main() {
  final pairs = [for (var p = 2; p <= 50; p++) if (isPrime(p) && isPrime(100 - p)) '$p+${100 - p}'];
  print('${pairs.length} $pairs');
}
