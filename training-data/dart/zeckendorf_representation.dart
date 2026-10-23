List<int> zeckendorf(int n) {
  final fibs = [1, 2];
  while (fibs[fibs.length - 1] + fibs[fibs.length - 2] <= n) {
    fibs.add(fibs[fibs.length - 1] + fibs[fibs.length - 2]);
  }
  final parts = <int>[];
  for (final f in fibs.reversed) {
    if (f <= n) {
      parts.add(f);
      n -= f;
    }
  }
  return parts;
}

void main() {
  print(zeckendorf(100).join(' '));
}
