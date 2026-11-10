bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  final found = <int>[];
  for (var p = 2; found.length < 10; p++) {
    if (isPrime(p) && isPrime(2 * p + 1)) found.add(p);
  }
  print(found.join(' ')); // 2 3 5 11 23 29 41 53 83 89
}
