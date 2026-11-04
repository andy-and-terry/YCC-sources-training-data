void main() {
  for (final b in [2, 8, 16, 36]) {
    print('255 in base $b = ${255.toRadixString(b)}');
  }
  print(int.parse('zz', radix: 36));
  print(int.tryParse('9', radix: 8)); // null
}
