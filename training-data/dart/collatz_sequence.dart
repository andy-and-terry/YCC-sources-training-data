// Collatz sequence with memoized step counts.

List<int> collatzPath(int n) {
  final path = <int>[n];
  while (n != 1) {
    n = n.isEven ? n ~/ 2 : 3 * n + 1;
    path.add(n);
  }
  return path;
}

final Map<int, int> _cache = {1: 0};

int steps(int n) {
  final cached = _cache[n];
  if (cached != null) return cached;
  final result = 1 + steps(n.isEven ? n ~/ 2 : 3 * n + 1);
  _cache[n] = result;
  return result;
}

void main() {
  print('Path for 6: ${collatzPath(6)}');
  print('Steps for 27: ${steps(27)}');

  var bestStart = 1;
  var bestSteps = 0;
  for (var i = 1; i < 10000; i++) {
    final s = steps(i);
    if (s > bestSteps) {
      bestSteps = s;
      bestStart = i;
    }
  }
  print('Longest chain under 10000: start $bestStart, $bestSteps steps');
}
