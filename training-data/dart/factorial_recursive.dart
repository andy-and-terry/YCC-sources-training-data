int factorial(int n) => n <= 1 ? 1 : n * factorial(n - 1);

void main() {
  for (var i = 0; i <= 10; i++) {
    print(factorial(i));
  }
}
