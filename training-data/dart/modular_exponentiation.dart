int modPow(int base, int exponent, int modulus) {
  var result = 1;
  base %= modulus;
  while (exponent > 0) {
    if (exponent & 1 == 1) result = result * base % modulus;
    exponent >>= 1;
    base = base * base % modulus;
  }
  return result;
}

void main() {
  print(modPow(2, 10, 1000));
  print(modPow(7, 128, 13));
}
