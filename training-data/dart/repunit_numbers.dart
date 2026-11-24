// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
void main() {
  var r = 0;
  for (var n = 1; n <= 8; n++) {
    r = r * 10 + 1;
    print('$r${r % 3 == 0 ? "  (divisible by 3)" : ""}');
  }
}
