// Greedy sequence whose pairwise sums are all distinct.
void main() {
  final seq = <int>[];
  final sums = <int>{};
  for (var cand = 1; seq.length < 8; cand++) {
    final fresh = [for (final x in [...seq, cand]) x + cand];
    if (fresh.toSet().length == fresh.length && fresh.every((s) => !sums.contains(s))) {
      seq.add(cand);
      sums.addAll(fresh);
    }
  }
  print(seq.join(' '));
}
