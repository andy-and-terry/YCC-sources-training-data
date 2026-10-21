// P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
void main() {
  var a = 0, b = 1;
  for (var i = 0; i < 15; i++) {
    print('P($i) = $a');
    final next = 2 * b + a;
    a = b;
    b = next;
  }
}
