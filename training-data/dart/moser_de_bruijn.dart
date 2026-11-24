// Moser-de Bruijn sequence: binary digits of n read in base 4.
void main() {
  print([for (var n = 0; n < 12; n++) int.parse(n.toRadixString(2), radix: 4)].join(' '));
}
