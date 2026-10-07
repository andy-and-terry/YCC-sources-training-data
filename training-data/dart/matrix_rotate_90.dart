List<List<T>> rotateClockwise<T>(List<List<T>> m) => [
      for (var c = 0; c < m.first.length; c++) [for (var r = m.length - 1; r >= 0; r--) m[r][c]]
    ];

void main() {
  rotateClockwise([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ]).forEach(print);
}
