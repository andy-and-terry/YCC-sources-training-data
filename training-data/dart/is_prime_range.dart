bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  print([for (var n = 2; n <= 30; n++) if (isPrime(n)) n]);
}
