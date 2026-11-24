// Centered square numbers: n^2 + (n+1)^2.
void main() {
  print([for (var n = 0; n < 10; n++) n * n + (n + 1) * (n + 1)].join(' '));
}
