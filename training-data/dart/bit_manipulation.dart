int popCount(int n) {
  var count = 0;
  while (n != 0) {
    n &= n - 1;
    count++;
  }
  return count;
}

bool isPowerOfTwo(int n) => n > 0 && (n & (n - 1)) == 0;

void main() {
  const value = 0xB4;
  print(value.toRadixString(2));
  print('pop count: ${popCount(value)}');
  print('bit length: ${value.bitLength}');
  print('set bit 0: ${(value | 1).toRadixString(2)}');
  print('clear bit 2: ${(value & ~(1 << 2)).toRadixString(2)}');
  print('toggle bit 7: ${(value ^ (1 << 7)).toRadixString(2)}');
  print('lowest set bit: ${value & -value}');
  print('power of two: ${isPowerOfTwo(64)} ${isPowerOfTwo(66)}');
  print('shift: ${1 << 10} ${1024 >> 3} ${-16 >>> 60}');
}
