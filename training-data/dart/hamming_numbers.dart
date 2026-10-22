// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
bool isHamming(int n) {
  for (final p in [2, 3, 5]) {
    while (n % p == 0) {
      n ~/= p;
    }
  }
  return n == 1;
}

void main() {
  final found = <int>[];
  for (var n = 1; found.length < 20; n++) {
    if (isHamming(n)) found.add(n);
  }
  print(found.join(' '));
}
