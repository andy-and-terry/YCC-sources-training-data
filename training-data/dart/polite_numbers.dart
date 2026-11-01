// Ways to write n as a sum of two or more consecutive positive integers.
int politeWays(int n) {
  var ways = 0;
  for (var k = 2; k * (k + 1) ~/ 2 <= n; k++) {
    if ((n - k * (k - 1) ~/ 2) % k == 0) ways++;
  }
  return ways;
}

void main() {
  print([for (var n = 1; n <= 16; n++) politeWays(n)].join(' '));
}
