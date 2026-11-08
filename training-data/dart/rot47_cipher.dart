String rot47(String s) => String.fromCharCodes(s.codeUnits.map((c) =>
    c >= 33 && c <= 126 ? 33 + (c - 33 + 47) % 94 : c));

void main() {
  final e = rot47('Hello, World!');
  print(e);
  print(rot47(e));
}
