List<int> _buildFailure(String pattern) {
  final fail = List<int>.filled(pattern.length, 0);
  var k = 0;
  for (var i = 1; i < pattern.length; i++) {
    while (k > 0 && pattern[k] != pattern[i]) {
      k = fail[k - 1];
    }
    if (pattern[k] == pattern[i]) k++;
    fail[i] = k;
  }
  return fail;
}

List<int> kmpSearch(String text, String pattern) {
  final matches = <int>[];
  if (pattern.isEmpty) return matches;

  final fail = _buildFailure(pattern);
  var k = 0;

  for (var i = 0; i < text.length; i++) {
    while (k > 0 && pattern[k] != text[i]) {
      k = fail[k - 1];
    }
    if (pattern[k] == text[i]) k++;
    if (k == pattern.length) {
      matches.add(i - pattern.length + 1);
      k = fail[k - 1];
    }
  }

  return matches;
}

void main() {
  print(kmpSearch('ababcabcabababd', 'ababd'));
}
