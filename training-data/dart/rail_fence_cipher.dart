String encode(String s, int rails) {
  final rows = List.generate(rails, (_) => StringBuffer());
  var r = 0, dir = 1;
  for (final ch in s.split('')) {
    rows[r].write(ch);
    if (r == 0) dir = 1;
    if (r == rails - 1) dir = -1;
    r += dir;
  }
  return rows.join();
}

void main() => print(encode('WEAREDISCOVERED', 3));
