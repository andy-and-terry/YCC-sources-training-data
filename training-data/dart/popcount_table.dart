// Population count (number of set bits) for 0..15
int bits(int n) {
  var c = 0;
  while (n > 0) {
    c += n & 1;
    n >>= 1;
  }
  return c;
}

void main() {
  print(List.generate(16, bits).join(' '));
}
