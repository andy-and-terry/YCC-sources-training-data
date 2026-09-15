int countIslands(List<List<int>> grid) {
  if (grid.isEmpty) return 0;

  final rows = grid.length;
  final cols = grid[0].length;
  var count = 0;

  void flood(int r, int c) {
    if (r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] == 0) return;
    grid[r][c] = 0;
    flood(r + 1, c);
    flood(r - 1, c);
    flood(r, c + 1);
    flood(r, c - 1);
  }

  for (var r = 0; r < rows; r++) {
    for (var c = 0; c < cols; c++) {
      if (grid[r][c] == 1) {
        count++;
        flood(r, c);
      }
    }
  }

  return count;
}

void main() {
  final grid = [
    [1, 1, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 0, 1, 1],
  ];

  print(countIslands(grid));
}
