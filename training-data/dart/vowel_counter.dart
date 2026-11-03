Map<String, int> countVowels(String s) {
  final counts = <String, int>{};
  for (final c in s.toLowerCase().split('')) {
    if ('aeiou'.contains(c)) counts.update(c, (v) => v + 1, ifAbsent: () => 1);
  }
  return counts;
}

void main() => print(countVowels('Education is beautiful'));
