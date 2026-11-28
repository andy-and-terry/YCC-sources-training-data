bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

int reverse(int n) => int.parse(n.toString().split('').reversed.join());

void main() {
  final emirps = [
    for (var p = 2; p < 200; p++)
      if (reverse(p) != p && isPrime(p) && isPrime(reverse(p))) p
  ];
  print(emirps); // [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
}
