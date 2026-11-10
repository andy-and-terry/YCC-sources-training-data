// Read the binary digits of i as base-4 digits.
int moserDeBruijn(int i) => i == 0 ? 0 : int.parse(i.toRadixString(2), radix: 4);

void main() {
  print(List.generate(10, moserDeBruijn).join(' ')); // 0 1 4 5 16 17 20 21 64 65
}
