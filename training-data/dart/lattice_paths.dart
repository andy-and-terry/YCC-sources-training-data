// Lattice paths with a DP row.
int lattice(int n) {
  final row = List.filled(n + 1, 1);
  for (var k = 0; k < n; k++) {
    for (var j = 1; j <= n; j++) {
      row[j] += row[j - 1];
    }
  }
  return row[n];
}

void main() => print(lattice(3));
