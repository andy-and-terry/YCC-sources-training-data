List<int> varint(int n) {
  final out = <int>[];
  while (n >= 0x80) {
    out.add((n & 0x7F) | 0x80);
    n >>= 7;
  }
  out.add(n);
  return out;
}

void main() => print(varint(300).map((b) => b.toRadixString(16)).toList());
