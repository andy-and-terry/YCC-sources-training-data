String decode(String text) {
  final buf = StringBuffer();
  for (final c in text.toLowerCase().codeUnits) {
    if (c >= 97 && c <= 122) {
      buf.writeCharCode(219 - c);
    } else if (c >= 48 && c <= 57) {
      buf.writeCharCode(c);
    }
  }
  return buf.toString();
}

String encode(String text) {
  final d = decode(text);
  return [for (var i = 0; i < d.length; i += 5) d.substring(i, i + 5 > d.length ? d.length : i + 5)].join(' ');
}

void main() {
  final e = encode('The quick brown fox');
  print('$e -> ${decode(e)}');
}
