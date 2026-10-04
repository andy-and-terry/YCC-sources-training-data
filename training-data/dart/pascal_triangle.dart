List<List<int>> pascal(int rows) {
  final result = <List<int>>[];
  for (var i = 0; i < rows; i++) {
    final row = List<int>.filled(i + 1, 1);
    for (var j = 1; j < i; j++) {
      row[j] = result[i - 1][j - 1] + result[i - 1][j];
    }
    result.add(row);
  }
  return result;
}

void main() {
  for (final row in pascal(6)) {
    print(row.join(' ').padLeft(12 + row.length * 2));
  }
}
