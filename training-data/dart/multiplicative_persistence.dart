int persistence(int n) {
  var steps = 0;
  while (n >= 10) {
    n = n.toString().split('').map(int.parse).fold(1, (a, b) => a * b);
    steps++;
  }
  return steps;
}

void main() {
  for (final n in [39, 77, 999, 10]) {
    print('$n ${persistence(n)}');
  }
}
