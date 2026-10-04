int countSetBits(int n) {
  var c = 0;
  while (n != 0) {
    n &= n - 1;
    c++;
  }
  return c;
}

bool isBitSet(int n, int i) => (n >> i) & 1 == 1;

void main() {
  const x = 0xB4;
  print(x.toRadixString(2).padLeft(8, '0'));
  print('set bits: ${countSetBits(x)}');
  print('bit 2: ${isBitSet(x, 2)}, bit 3: ${isBitSet(x, 3)}');
  print('toggle: ${(x ^ 1).toRadixString(2)}');
  print('lowest set: ${x & -x}');
  print('bitLength: ${x.bitLength}');
  print('shift: ${1 << 10} ${-16 >> 2} ${-16 >>> 60}');
  print(int.parse('ff', radix: 16));
}
