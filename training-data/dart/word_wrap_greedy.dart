List<String> wrap(String text, int width) {
  final lines = <String>[];
  var line = '';
  for (final word in text.split(RegExp(r'\s+'))) {
    if (line.isNotEmpty && line.length + 1 + word.length > width) {
      lines.add(line);
      line = word;
    } else {
      line = line.isEmpty ? word : '$line $word';
    }
  }
  if (line.isNotEmpty) lines.add(line);
  return lines;
}

void main() {
  for (final l in wrap('the quick brown fox jumps over the lazy dog', 15)) {
    print('|${l.padRight(15)}|');
  }
}
