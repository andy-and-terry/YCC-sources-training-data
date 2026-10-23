// Conway's Game of Life on a wrapping grid.

class Life {
  final int rows;
  final int cols;
  List<List<bool>> grid;

  Life(this.rows, this.cols, Iterable<(int, int)> alive)
      : grid = List.generate(rows, (_) => List.filled(cols, false)) {
    for (final (r, c) in alive) {
      grid[r][c] = true;
    }
  }

  int neighbors(int r, int c) {
    var count = 0;
    for (var dr = -1; dr <= 1; dr++) {
      for (var dc = -1; dc <= 1; dc++) {
        if (dr == 0 && dc == 0) continue;
        if (grid[(r + dr) % rows][(c + dc) % cols]) count++;
      }
    }
    return count;
  }

  void step() {
    grid = List.generate(rows, (r) {
      return List.generate(cols, (c) {
        final n = neighbors(r, c);
        return grid[r][c] ? (n == 2 || n == 3) : n == 3;
      });
    });
  }

  @override
  String toString() =>
      grid.map((row) => row.map((x) => x ? '#' : '.').join()).join('\n');
}

void main() {
  final life = Life(6, 6, [(0, 1), (1, 2), (2, 0), (2, 1), (2, 2)]);
  for (var gen = 0; gen < 3; gen++) {
    print('Generation $gen:');
    print(life);
    life.step();
  }
}
