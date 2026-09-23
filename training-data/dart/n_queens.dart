List<List<int>> solveNQueens(int n) {
  final solutions = <List<int>>[];
  final columns = List<int>.filled(n, -1);

  bool isSafe(int row, int col) {
    for (var r = 0; r < row; r++) {
      final c = columns[r];
      if (c == col || (row - r).abs() == (col - c).abs()) return false;
    }
    return true;
  }

  void place(int row) {
    if (row == n) {
      solutions.add(List<int>.from(columns));
      return;
    }
    for (var col = 0; col < n; col++) {
      if (isSafe(row, col)) {
        columns[row] = col;
        place(row + 1);
        columns[row] = -1;
      }
    }
  }

  place(0);
  return solutions;
}

void main() {
  final solutions = solveNQueens(4);
  print('solutions: ${solutions.length}');
  print(solutions.first);
}
