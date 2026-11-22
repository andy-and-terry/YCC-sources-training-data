// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
void main() {
  var r = BigInt.zero;
  final out = <BigInt>[];
  for (var i = 0; i < 8; i++) {
    r = r * BigInt.from(10) + BigInt.one;
    out.add(r);
  }
  print(out.join(' '));
}
