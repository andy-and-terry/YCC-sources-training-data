void main() {
  print(0.1 + 0.2);
  print((0.1 + 0.2 - 0.3).abs() < 1e-9);
  print(double.nan == double.nan);
  print(double.infinity > 1e308);
  print(1 / 0);
  print(5.0.toInt());
  print(2.5.round());
  print((-2.5).round());
  print(9007199254740993);
  print(double.maxFinite > 1e300);
  print(7.isOdd);
  print((-5).abs().sign);
}
