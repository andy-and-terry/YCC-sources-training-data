String zigzag(String s, int rows) {
  if (rows == 1 || rows >= s.length) return s;
  final lines = List.generate(rows, (_) => StringBuffer());
  var r = 0, step = 1;
  for (final c in s.split('')) {
    lines[r].write(c);
    if (r == 0) {
      step = 1;
    } else if (r == rows - 1) {
      step = -1;
    }
    r += step;
  }
  return lines.join();
}

void main() => print(zigzag('PAYPALISHIRING', 3));
