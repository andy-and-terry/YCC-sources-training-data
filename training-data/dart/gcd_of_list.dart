int gcd(int a, int b) => b == 0 ? a.abs() : gcd(b, a % b);

int gcdAll(List<int> nums) => nums.fold(0, gcd);

void main() {
  print(gcdAll([12, 18, 24]));
  print(gcdAll([7, 13]));
}
