// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
bool isKeith(int n) {
  final seq = n.toString().split('').map(int.parse).toList();
  final k = seq.length;
  while (seq.last < n) {
    seq.add(seq.sublist(seq.length - k).reduce((a, b) => a + b));
  }
  return seq.last == n;
}

void main() {
  print([for (var n = 10; n < 1200; n++) if (isKeith(n)) n].join(' '));
}
