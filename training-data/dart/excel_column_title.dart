String columnTitle(int n) {
  final chars = <String>[];
  while (n > 0) {
    n--;
    chars.add(String.fromCharCode(65 + n % 26));
    n ~/= 26;
  }
  return chars.reversed.join();
}

void main() {
  print('${columnTitle(28)} ${columnTitle(701)}'); // AB ZY
}
