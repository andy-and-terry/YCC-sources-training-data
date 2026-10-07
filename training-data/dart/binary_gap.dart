int binaryGap(int n) {
  final trimmed = n.toRadixString(2).replaceAll(RegExp(r'0+$'), '');
  return trimmed.split('1').fold(0, (best, s) => s.length > best ? s.length : best);
}

void main() {
  for (final n in [9, 529, 20, 15, 1041]) {
    print('$n ${n.toRadixString(2)} ${binaryGap(n)}');
  }
}
