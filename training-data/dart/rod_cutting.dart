int rodCutting(List<int> prices, int length) {
  final best = List<int>.filled(length + 1, 0);

  for (var n = 1; n <= length; n++) {
    for (var cut = 1; cut <= n; cut++) {
      final revenue = prices[cut - 1] + best[n - cut];
      if (revenue > best[n]) best[n] = revenue;
    }
  }

  return best[length];
}

void main() {
  final prices = [1, 5, 8, 9, 10, 17, 17, 20];
  print(rodCutting(prices, 4));
  print(rodCutting(prices, 8));
}
