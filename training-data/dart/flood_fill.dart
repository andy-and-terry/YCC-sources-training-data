import 'dart:collection';

void floodFill(List<List<int>> img, int sr, int sc, int color) {
  final original = img[sr][sc];
  if (original == color) return;
  final queue = Queue<(int, int)>()..add((sr, sc));
  img[sr][sc] = color;
  const dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)];
  while (queue.isNotEmpty) {
    final (r, c) = queue.removeFirst();
    for (final (dr, dc) in dirs) {
      final nr = r + dr, nc = c + dc;
      if (nr >= 0 &&
          nr < img.length &&
          nc >= 0 &&
          nc < img[0].length &&
          img[nr][nc] == original) {
        img[nr][nc] = color;
        queue.add((nr, nc));
      }
    }
  }
}

void main() {
  final img = [
    [1, 1, 0],
    [1, 0, 0],
    [1, 1, 1],
  ];
  floodFill(img, 0, 0, 7);
  img.forEach((row) => print(row.join(' ')));
}
