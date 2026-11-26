// Emirps below 200; expect 15.
bool isPrime(int n) {
  if (n < 2) return false;
  for (var d = 2; d * d <= n; d++) {
    if (n % d == 0) return false;
  }
  return true;
}

int rev(int n) => int.parse(n.toString().split('').reversed.join());

void main() {
  final found = [for (var n = 2; n < 200; n++) if (rev(n) != n && isPrime(n) && isPrime(rev(n))) n];
  print('${found.length} $found');
}
