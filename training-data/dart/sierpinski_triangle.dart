void main() {
  const n = 8;
  for (var r = 0; r < n; r++) {
    final row = [for (var c = 0; c <= r; c++) (r & c) == c ? '* ' : '  '].join();
    print(' ' * (n - r - 1) + row);
  }
}
