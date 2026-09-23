List<int> rabinKarpSearch(String text, String pattern) {
  const base = 256;
  const modulus = 1000003;
  final n = text.length;
  final m = pattern.length;
  final matches = <int>[];
  if (m == 0 || m > n) return matches;

  var highOrder = 1;
  for (var i = 0; i < m - 1; i++) {
    highOrder = (highOrder * base) % modulus;
  }

  var patternHash = 0;
  var windowHash = 0;
  for (var i = 0; i < m; i++) {
    patternHash = (patternHash * base + pattern.codeUnitAt(i)) % modulus;
    windowHash = (windowHash * base + text.codeUnitAt(i)) % modulus;
  }

  for (var i = 0; i <= n - m; i++) {
    if (patternHash == windowHash && text.substring(i, i + m) == pattern) {
      matches.add(i);
    }
    if (i < n - m) {
      windowHash = (base * (windowHash - text.codeUnitAt(i) * highOrder) +
              text.codeUnitAt(i + m)) %
          modulus;
      if (windowHash < 0) windowHash += modulus;
    }
  }
  return matches;
}

void main() {
  print(rabinKarpSearch('abracadabra', 'abra'));
}
