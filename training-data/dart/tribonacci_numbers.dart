// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
Iterable<int> tribonacci() sync* {
  var a = 0, b = 0, c = 1;
  while (true) {
    yield a;
    final next = a + b + c;
    a = b;
    b = c;
    c = next;
  }
}

void main() {
  print('Tribonacci: ${tribonacci().take(15).join(', ')}');
}
