int digitSum(int n) {
  var s = 0;
  while (n > 0) {
    s += n % 10;
    n ~/= 10;
  }
  return s;
}

List<int> primeFactors(int n) {
  final fs = <int>[];
  var p = 2;
  while (n > 1) {
    if (p * p > n) {
      fs.add(n);
      break;
    }
    while (n % p == 0) {
      fs.add(p);
      n ~/= p;
    }
    p++;
  }
  return fs;
}

bool isSmith(int n) {
  final fs = primeFactors(n);
  return fs.length > 1 && digitSum(n) == fs.map(digitSum).reduce((a, b) => a + b);
}

void main() {
  print([for (var n = 2; n < 100; n++) if (isSmith(n)) n].join(' '));
}
