bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  final primes = [for (var n = 2; n <= 20; n++) if (isPrime(n)) n];
  print(primes);
}
