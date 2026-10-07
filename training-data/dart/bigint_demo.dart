BigInt factorial(int n) {
  var result = BigInt.one;
  for (var i = 2; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

void main() {
  print(factorial(25));

  final a = BigInt.parse('123456789012345678901234567890');
  final b = BigInt.from(987654321);
  print(a * b);
  print(a ~/ b);
  print(a % b);
  print(a.pow(2).bitLength);
  print(BigInt.two.pow(100));
  print(BigInt.from(48).gcd(BigInt.from(18)));
  print(BigInt.from(4).modPow(BigInt.from(13), BigInt.from(497)));
  print(a.toRadixString(16));
  print(a.isValidInt);
}
