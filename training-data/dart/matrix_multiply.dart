List<List<int>> matrixMultiply(List<List<int>> a, List<List<int>> b) {
  final rows = a.length;
  final cols = b[0].length;
  final inner = b.length;
  final result = List.generate(rows, (_) => List<int>.filled(cols, 0));
  for (var i = 0; i < rows; i++) {
    for (var j = 0; j < cols; j++) {
      for (var k = 0; k < inner; k++) {
        result[i][j] += a[i][k] * b[k][j];
      }
    }
  }
  return result;
}

void main() {
  print(matrixMultiply([[1, 2], [3, 4]], [[5, 6], [7, 8]]));
}
