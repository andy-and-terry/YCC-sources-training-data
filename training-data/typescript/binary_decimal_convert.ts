function binaryToDecimal(binary: string): number {
  return parseInt(binary, 2);
}

function decimalToBinary(n: number): string {
  return n.toString(2);
}

console.log(binaryToDecimal('1010'));
console.log(decimalToBinary(10));
