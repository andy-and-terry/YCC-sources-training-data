// Remove consecutive duplicate characters.
String dedupe(String s) {
  final b = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i == 0 || s[i] != s[i - 1]) b.write(s[i]);
  }
  return b.toString();
}

void main() => print(dedupe('aabbbcdd'));
