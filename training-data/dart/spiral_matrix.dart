List<List<int>> spiral(int n) {
  final g = List.generate(n, (_) => List.filled(n, 0));
  var top = 0, left = 0, bottom = n - 1, right = n - 1, k = 1;
  while (top <= bottom && left <= right) {
    for (var c = left; c <= right; c++) g[top][c] = k++;
    top++;
    for (var r = top; r <= bottom; r++) g[r][right] = k++;
    right--;
    if (top <= bottom) {
      for (var c = right; c >= left; c--) g[bottom][c] = k++;
      bottom--;
    }
    if (left <= right) {
      for (var r = bottom; r >= top; r--) g[r][left] = k++;
      left++;
    }
  }
  return g;
}

void main() {
  for (final row in spiral(4)) {
    print(row.map((v) => v.toString().padLeft(2)).join(' '));
  }
}
