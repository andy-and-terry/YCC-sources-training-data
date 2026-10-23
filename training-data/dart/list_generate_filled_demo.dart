void main() {
  final squares = List.generate(5, (i) => i * i);
  print(squares);

  final zeros = List.filled(3, 0);
  print(zeros);

  final grid = List.generate(2, (_) => List.filled(3, '.'));
  grid[0][1] = '#';
  print(grid);

  final growable = List<int>.empty(growable: true)..add(1)..add(2);
  print(growable);

  final fixed = List<int>.filled(2, 7);
  try {
    fixed.add(1);
  } on UnsupportedError {
    print('fixed-length list');
  }
}
