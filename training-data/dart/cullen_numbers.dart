int cullen(int n) => n * (1 << n) + 1;

void main() {
  print([for (var n = 0; n < 10; n++) cullen(n)].join(' '));
}
