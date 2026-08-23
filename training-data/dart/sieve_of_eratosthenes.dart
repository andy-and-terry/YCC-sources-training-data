List<int> sieve(int limit) {
  final isPrime = List<bool>.filled(limit + 1, true);
  isPrime[0] = false;
  if (limit >= 1) isPrime[1] = false;
  for (var n = 2; n * n <= limit; n++) {
    if (isPrime[n]) {
      for (var m = n * n; m <= limit; m += n) {
        isPrime[m] = false;
      }
    }
  }
  return [for (var n = 0; n <= limit; n++) if (isPrime[n]) n];
}

void main() {
  print(sieve(50));
}
