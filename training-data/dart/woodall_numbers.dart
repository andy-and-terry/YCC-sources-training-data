int woodall(int n) => n * (1 << n) - 1;

void main() {
  print([for (var n = 1; n <= 10; n++) woodall(n)].join(' '));
}
