void main() {
  final sb = StringBuffer();
  for (var i = 1; i <= 5; i++) {
    sb.write(i);
    if (i < 5) sb.write(', ');
  }
  sb.writeln();
  sb.writeAll(['a', 'b', 'c'], '-');
  print(sb);
  print('length: ${sb.length}');
  sb.clear();
  print('empty: ${sb.isEmpty}');
}
