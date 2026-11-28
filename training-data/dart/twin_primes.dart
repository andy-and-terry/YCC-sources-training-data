void main() {
  const n = 50;
  final composite = List<bool>.filled(n + 1, false);
  for (var i = 2; i * i <= n; i++) {
    if (!composite[i]) {
      for (var j = i * i; j <= n; j += i) {
        composite[j] = true;
      }
    }
  }
  for (var p = 3; p + 2 <= n; p++) {
    if (!composite[p] && !composite[p + 2]) print('($p, ${p + 2})');
  }
}
