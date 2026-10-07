void main() {
  const s = 'Hi \u{1F600}!';
  print(s.length);               // UTF-16 code units
  print(s.runes.length);         // code points
  print(s.runes.map((r) => r.toRadixString(16)).toList());
  print(s.codeUnitAt(0));
  print(String.fromCharCode(0x41));
  print(String.fromCharCodes([72, 105]));
  print(s.describe);
}

extension on String {
  String get describe => runes.length == length ? 'BMP only' : 'has astral chars';
}
