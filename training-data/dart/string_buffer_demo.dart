void main() {
  final sb = StringBuffer();
  for (var i = 1; i <= 5; i++) {
    if (i > 1) sb.write(', ');
    sb.write(i);
  }
  sb.writeln('!');
  sb.writeAll(['a', 'b', 'c'], '-');
  print(sb.toString());
  print(sb.length);
  sb.clear();
  print(sb.isEmpty);
}
