int binaryToDecimal(String bin) => int.parse(bin, radix: 2);

void main() {
  print(binaryToDecimal('1010'));
  print(binaryToDecimal('11111111'));
}
