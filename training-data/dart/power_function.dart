int power(int base, int exp) {
  var result = 1;
  for (var i = 0; i < exp; i++) result *= base;
  return result;
}

void main() {
  print(power(2, 10));
  print(power(3, 5));
}
