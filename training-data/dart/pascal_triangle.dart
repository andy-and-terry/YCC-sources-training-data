List<List<int>> pascal(int rows) {
  final triangle = <List<int>>[];
  for (var i = 0; i < rows; i++) {
    final row = List<int>.filled(i + 1, 1);
    for (var j = 1; j < i; j++) {
      row[j] = triangle[i - 1][j - 1] + triangle[i - 1][j];
    }
    triangle.add(row);
  }
  return triangle;
}

void main() {
  for (final row in pascal(6)) {
    print(row.join(' '));
  }
}
