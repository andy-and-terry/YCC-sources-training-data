int _cross(List<int> o, List<int> a, List<int> b) {
  return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);
}

List<List<int>> convexHull(List<List<int>> points) {
  if (points.length < 3) return List.from(points);

  final sorted = List<List<int>>.from(points)
    ..sort((a, b) => a[0] != b[0] ? a[0] - b[0] : a[1] - b[1]);

  final lower = <List<int>>[];
  for (final p in sorted) {
    while (lower.length >= 2 &&
        _cross(lower[lower.length - 2], lower.last, p) <= 0) {
      lower.removeLast();
    }
    lower.add(p);
  }

  final upper = <List<int>>[];
  for (final p in sorted.reversed) {
    while (upper.length >= 2 &&
        _cross(upper[upper.length - 2], upper.last, p) <= 0) {
      upper.removeLast();
    }
    upper.add(p);
  }

  lower.removeLast();
  upper.removeLast();
  return [...lower, ...upper];
}

void main() {
  final points = [
    [0, 0],
    [1, 1],
    [2, 2],
    [2, 0],
    [0, 2],
    [1, 0],
    [0, 1],
  ];
  print(convexHull(points));
}
