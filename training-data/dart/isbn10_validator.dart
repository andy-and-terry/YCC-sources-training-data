bool isValidIsbn10(String isbn) {
  final s = isbn.replaceAll('-', '');
  if (!RegExp(r'^\d{9}[\dX]$').hasMatch(s)) return false;
  var total = 0;
  for (var i = 0; i < 10; i++) {
    total += (s[i] == 'X' ? 10 : int.parse(s[i])) * (10 - i);
  }
  return total % 11 == 0;
}

void main() {
  for (final s in ['3-598-21508-8', '3-598-21507-X', '3-598-21508-9']) {
    print('$s ${isValidIsbn10(s)}');
  }
}
