int fletcher16(List<int> data) {
  var s1 = 0, s2 = 0;
  for (final b in data) {
    s1 = (s1 + b) % 255;
    s2 = (s2 + s1) % 255;
  }
  return (s2 << 8) | s1;
}

void main() {
  print(fletcher16('abcde'.codeUnits).toRadixString(16));
}
