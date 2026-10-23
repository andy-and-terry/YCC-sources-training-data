bool lucasLehmer(int p) {
  if (p == 2) return true;
  final m = (1 << p) - 1;
  var s = 4;
  for (var i = 0; i < p - 2; i++) {
    s = (s * s - 2) % m;
  }
  return s == 0;
}

void main() {
  print([for (final p in [2, 3, 5, 7, 11, 13, 17, 19]) if (lucasLehmer(p)) p].join(' '));
}
