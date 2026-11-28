int modInverse(int a, int m) {
  for (var x = 1; x < m; x++) {
    if (a * x % m == 1) return x;
  }
  return 0;
}

String affine(String s, int a, int b, {bool decrypt = false}) {
  final inv = modInverse(a, 26);
  return s.runes.map((r) {
    if (r < 65 || r > 90) return String.fromCharCode(r);
    final x = r - 65;
    final y = decrypt ? (inv * (x - b)) % 26 : (a * x + b) % 26; // Dart % is non-negative
    return String.fromCharCode(y + 65);
  }).join();
}

void main() {
  final c = affine('AFFINE', 5, 8);
  print('$c ${affine(c, 5, 8, decrypt: true)}');
}
