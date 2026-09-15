List<int> buildLps(String pattern) {
  final lps = List<int>.filled(pattern.length, 0);
  var len = 0;
  var i = 1;
  while (i < pattern.length) {
    if (pattern[i] == pattern[len]) {
      len++;
      lps[i] = len;
      i++;
    } else if (len != 0) {
      len = lps[len - 1];
    } else {
      lps[i] = 0;
      i++;
    }
  }
  return lps;
}

int kmpSearch(String text, String pattern) {
  if (pattern.isEmpty) return 0;
  final lps = buildLps(pattern);
  var i = 0, j = 0;
  while (i < text.length) {
    if (text[i] == pattern[j]) {
      i++;
      j++;
      if (j == pattern.length) return i - j;
    } else if (j != 0) {
      j = lps[j - 1];
    } else {
      i++;
    }
  }
  return -1;
}

void main() {
  print(kmpSearch('abxabcabcaby', 'abcaby'));
  print(kmpSearch('hello world', 'world'));
  print(kmpSearch('hello world', 'xyz'));
}
