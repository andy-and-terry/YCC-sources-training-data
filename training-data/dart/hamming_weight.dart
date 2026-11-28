int popcount(int n) {
  var c = 0;
  while (n != 0) {
    n &= n - 1;
    c++;
  }
  return c;
}

void main() {
  print(popcount(0xB7));
  print(0xB7.toRadixString(2).split('').where((b) => b == '1').length);
}
