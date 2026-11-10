bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  final out = <int>[];
  for (var n = 2; out.length < 10; n++) {
    final r = int.parse(n.toString().split('').reversed.join());
    if (r != n && isPrime(n) && isPrime(r)) out.add(n);
  }
  print(out.join(' ')); // 13 17 31 37 71 73 79 97 107 113
}
