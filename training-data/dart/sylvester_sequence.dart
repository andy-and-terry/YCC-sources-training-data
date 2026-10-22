// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
// Dart ints are 64-bit on the VM, so only s(0)..s(6) fit.
void main() {
  var s = 2;
  for (var i = 0; i < 7; i++) {
    print('s($i) = $s');
    s = s * s - s + 1;
  }
}
