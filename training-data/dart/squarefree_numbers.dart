// Squarefree numbers up to 100; expect 61.
bool squarefree(int n) {
  for (var d = 2; d * d <= n; d++) {
    if (n % (d * d) == 0) return false;
  }
  return true;
}

void main() {
  print([for (var n = 1; n <= 100; n++) if (squarefree(n)) n].length);
}
