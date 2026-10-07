import 'dart:math';

List<(int, int)> saddlePoints(List<List<int>> m) {
  if (m.isEmpty) return [];
  final colMin = [for (var c = 0; c < m[0].length; c++) m.map((row) => row[c]).reduce(min)];
  return [
    for (var r = 0; r < m.length; r++)
      for (var c = 0; c < m[r].length; c++)
        if (m[r][c] == m[r].reduce(max) && m[r][c] == colMin[c]) (r, c)
  ];
}

void main() {
  print(saddlePoints([
    [9, 8, 7],
    [5, 3, 2],
    [6, 6, 7],
  ]));
}
