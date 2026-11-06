// Integer (1..3999) to Roman numeral using a greedy table.
const table = <(int, String)>[
  (1000, 'M'), (900, 'CM'), (500, 'D'), (400, 'CD'), (100, 'C'), (90, 'XC'),
  (50, 'L'), (40, 'XL'), (10, 'X'), (9, 'IX'), (5, 'V'), (4, 'IV'), (1, 'I'),
];

String toRoman(int n) {
  final sb = StringBuffer();
  for (final (value, symbol) in table) {
    while (n >= value) {
      sb.write(symbol);
      n -= value;
    }
  }
  return sb.toString();
}

void main() => print('${toRoman(1994)} ${toRoman(58)}');
