const ROMAN_VALUES = [
  [1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'],
  [100, 'C'], [90, 'XC'], [50, 'L'], [40, 'XL'],
  [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I'],
];

function toRoman(n) {
  let result = '';
  for (const [value, symbol] of ROMAN_VALUES) {
    while (n >= value) {
      result += symbol;
      n -= value;
    }
  }
  return result;
}

function fromRoman(s) {
  const values = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000 };
  let total = 0;
  for (let i = 0; i < s.length; i++) {
    const value = values[s[i]];
    if (i + 1 < s.length && values[s[i + 1]] > value) {
      total -= value;
    } else {
      total += value;
    }
  }
  return total;
}

console.log(toRoman(1994));
console.log(fromRoman('MCMXCIV'));
module.exports = { toRoman, fromRoman };
