// Thue-Morse: t(n) is the parity of the number of 1 bits in n
int parity(int n) {
  var p = 0;
  for (; n > 0; n >>= 1) {
    p ^= n & 1;
  }
  return p;
}

void main() {
  print(List.generate(32, parity).join());
}
