const int _base = 256;
const int _modulus = 1000000007;

List<int> rabinKarpSearch(String text, String pattern) {
  final matches = <int>[];
  final n = text.length, m = pattern.length;
  if (m == 0 || m > n) return matches;

  var patternHash = 0, windowHash = 0, highOrder = 1;
  for (var i = 0; i < m - 1; i++) {
    highOrder = highOrder * _base % _modulus;
  }

  for (var i = 0; i < m; i++) {
    patternHash = (patternHash * _base + pattern.codeUnitAt(i)) % _modulus;
    windowHash = (windowHash * _base + text.codeUnitAt(i)) % _modulus;
  }

  for (var i = 0; i <= n - m; i++) {
    if (windowHash == patternHash && text.substring(i, i + m) == pattern) {
      matches.add(i);
    }
    if (i < n - m) {
      windowHash = (windowHash -
                  text.codeUnitAt(i) * highOrder % _modulus +
                  _modulus) %
              _modulus;
      windowHash = (windowHash * _base + text.codeUnitAt(i + m)) % _modulus;
    }
  }

  return matches;
}

void main() {
  print(rabinKarpSearch('abxabcabcaby', 'abcaby'));
  print(rabinKarpSearch('aaaaa', 'aa'));
}
