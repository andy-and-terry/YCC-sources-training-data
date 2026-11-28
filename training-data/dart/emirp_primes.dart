bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

int rev(int n) => int.parse(n.toString().split('').reversed.join());

void main() {
  final out = [
    for (var p = 2; p < 100; p++)
      if (isPrime(p) && rev(p) != p && isPrime(rev(p))) p
  ];
  print(out);
}
