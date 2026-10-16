void main() {
  print('7'.padLeft(3, '0'));
  print('ab'.padRight(5, '.') + '|');
  print(3.14159.toStringAsFixed(2));
  print(1234567.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => ','));
  print(255.toRadixString(16));
  print(10.toRadixString(2).padLeft(8, '0'));
  print(1e21.toStringAsExponential(2));
}
