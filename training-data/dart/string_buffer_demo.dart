void main() {
  final buffer = StringBuffer();
  buffer.write('Hello');
  buffer.write(', ');
  buffer.writeln('World');
  buffer.writeAll(['a', 'b', 'c'], '-');
  buffer.writeCharCode(33);

  print(buffer.toString());
  print(buffer.length);
  print(buffer.isEmpty);

  buffer.clear();
  for (var i = 1; i <= 5; i++) {
    buffer.write(i);
    if (i < 5) buffer.write(' < ');
  }
  print(buffer);

  const text = 'The quick brown fox';
  print(text.split(' ').map((w) => w[0].toUpperCase() + w.substring(1)).join(''));
  print(text.padLeft(22, '.'));
  print(text.replaceAll('o', '0'));
  print(text.contains('quick'));
}
