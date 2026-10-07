int popcount(int n) {
  var count = 0;
  while (n != 0) {
    n &= n - 1;
    count++;
  }
  return count;
}

void main() {
  const n = 0xB4;
  print(popcount(n));
  print(n.toRadixString(2));
  print(n & -n);
  print((n >> 2) & 1);
  print(1 << 5);
  print(n ^ 0xFF);
  print(n.bitLength);
  print((n & (n - 1)) == 0);
  print((-8 >> 1));
  print(~5);
}
