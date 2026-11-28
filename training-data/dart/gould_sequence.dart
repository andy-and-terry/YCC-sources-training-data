int popcount(int n) {
  var c = 0;
  for (; n > 0; n >>= 1) {
    c += n & 1;
  }
  return c;
}

int gould(int n) => 1 << popcount(n);

void main() => print(List.generate(16, gould));
