Map<String, List<String>> groupAnagrams(List<String> words) {
  final groups = <String, List<String>>{};
  for (final word in words) {
    final chars = word.split('')..sort();
    final key = chars.join();
    groups.putIfAbsent(key, () => []).add(word);
  }
  return groups;
}

void main() {
  final words = ['eat', 'tea', 'tan', 'ate', 'nat', 'bat'];
  print(groupAnagrams(words).values.toList());
}
