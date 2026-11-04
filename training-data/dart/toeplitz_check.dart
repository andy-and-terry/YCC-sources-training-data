bool isToeplitz(List<List<int>> m) {
  for (var i = 1; i < m.length; i++) {
    for (var j = 1; j < m[i].length; j++) {
      if (m[i][j] != m[i - 1][j - 1]) return false;
    }
  }
  return true;
}

void main() {
  print(isToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]]));
  print(isToeplitz([[1, 2], [2, 2]]));
}
