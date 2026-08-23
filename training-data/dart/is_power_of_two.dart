bool isPowerOfTwo(int n) => n > 0 && (n & (n - 1)) == 0;

void main() {
  for (final n in [1, 2, 3, 4, 16, 18]) {
    print('$n: ${isPowerOfTwo(n)}');
  }
}
