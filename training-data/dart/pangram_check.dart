bool isPangram(String s) =>
    s.toLowerCase().split('').where((c) => RegExp('[a-z]').hasMatch(c)).toSet().length == 26;

void main() {
  print(isPangram('The quick brown fox jumps over the lazy dog'));
  print(isPangram('Hello world'));
}
