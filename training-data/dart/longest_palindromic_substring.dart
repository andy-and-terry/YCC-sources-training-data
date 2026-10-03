String longestPalindrome(String s) {
  if (s.isEmpty) return '';

  var start = 0, maxLen = 1;

  void expand(int left, int right) {
    while (left >= 0 && right < s.length && s[left] == s[right]) {
      if (right - left + 1 > maxLen) {
        start = left;
        maxLen = right - left + 1;
      }
      left--;
      right++;
    }
  }

  for (var i = 0; i < s.length; i++) {
    expand(i, i);
    expand(i, i + 1);
  }

  return s.substring(start, start + maxLen);
}

void main() {
  print(longestPalindrome('babad'));
  print(longestPalindrome('cbbd'));
}
