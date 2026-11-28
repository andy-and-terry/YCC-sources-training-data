String encode(String text, int rails) {
  final rows = List.generate(rails, (_) => StringBuffer());
  var r = 0, step = 1;
  for (final ch in text.split('')) {
    rows[r].write(ch);
    if (r == 0) step = 1;
    if (r == rails - 1) step = -1;
    r += step;
  }
  return rows.join();
}

void main() => print(encode('WEAREDISCOVERED', 3));
