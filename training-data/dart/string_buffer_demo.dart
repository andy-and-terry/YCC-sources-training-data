void main() {
  final buffer = StringBuffer();
  buffer.write('Hello');
  buffer.write(', ');
  buffer.writeln('World');
  buffer.writeAll(['a', 'b', 'c'], '-');
  buffer.writeCharCode(33);

  print(buffer.toString());
  print('length: ${buffer.length}');

  buffer.clear();
  for (var i = 1; i <= 5; i++) {
    buffer.write(i);
    if (i < 5) buffer.write(',');
  }
  print(buffer);
  print(buffer.isEmpty);
}
