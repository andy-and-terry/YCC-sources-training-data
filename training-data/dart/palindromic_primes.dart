bool isPrime(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

bool isPalindrome(int n) {
  final s = n.toString();
  return s == s.split('').reversed.join();
}

void main() {
  print([for (var n = 2; n < 200; n++) if (isPalindrome(n) && isPrime(n)) n]);
  // [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
}
