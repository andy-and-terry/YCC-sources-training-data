bool isSphenic(int n) {
  var distinct = 0;
  for (var p = 2; p * p <= n; p++) {
    if (n % p == 0) {
      n ~/= p;
      if (n % p == 0) return false;
      distinct++;
    }
  }
  return distinct + (n > 1 ? 1 : 0) == 3;
}

void main() {
  print([for (var n = 2; n < 80; n++) if (isSphenic(n)) n]);
}
