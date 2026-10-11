void main() {
  print('A'.codeUnitAt(0));
  print(String.fromCharCode(97));
  print(String.fromCharCodes([72, 105]));
  final shifted = 'abc'.codeUnits.map((c) => String.fromCharCode(c + 1)).join();
  print(shifted);
  print('z'.codeUnitAt(0) - 'a'.codeUnitAt(0));
  print('hello'.split('').reversed.join());
}
