function binaryToDecimal(binary) {
  return parseInt(binary, 2);
}

function decimalToBinary(n) {
  return n.toString(2);
}

console.log(binaryToDecimal('1010'));
console.log(decimalToBinary(10));

module.exports = { binaryToDecimal, decimalToBinary };
