List<MapEntry<String, int>> wordFrequency(String text) {
  final counts = <String, int>{};
  for (final word in text.toLowerCase().split(' ')) {
    counts[word] = (counts[word] ?? 0) + 1;
  }
  final entries = counts.entries.toList();
  entries.sort((a, b) => b.value.compareTo(a.value));
  return entries;
}

void main() {
  for (final e in wordFrequency('the quick brown fox jumps over the lazy dog the fox runs')) {
    print('${e.key}: ${e.value}');
  }
}
