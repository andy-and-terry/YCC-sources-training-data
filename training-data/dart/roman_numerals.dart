String intToRoman(int num) {
  const values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
  const symbols = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'];
  var n = num;
  final sb = StringBuffer();
  for (var i = 0; i < values.length; i++) {
    while (n >= values[i]) {
      sb.write(symbols[i]);
      n -= values[i];
    }
  }
  return sb.toString();
}

void main() {
  print(intToRoman(1994));
}
