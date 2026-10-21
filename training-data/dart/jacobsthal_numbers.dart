// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
Iterable<int> jacobsthal() sync* {
  var a = 0, b = 1;
  while (true) {
    yield a;
    final next = b + 2 * a;
    a = b;
    b = next;
  }
}

void main() {
  print(jacobsthal().take(15).join(' '));
}
