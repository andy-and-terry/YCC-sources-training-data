function lastItem(arr) {
  return arr.at(-1);
}

function secondToLast(arr) {
  return arr.at(-2);
}

function lastChar(str) {
  return str.at(-1);
}

const numbers = [10, 20, 30, 40, 50];
console.log(lastItem(numbers));
console.log(secondToLast(numbers));
console.log(numbers.at(0), numbers.at(-numbers.length));

const word = 'javascript';
console.log(lastChar(word));
console.log(word.at(0), word.at(-1));

function isPalindrome(str) {
  for (let i = 0; i < Math.floor(str.length / 2); i++) {
    if (str.at(i) !== str.at(-(i + 1))) return false;
  }
  return true;
}

console.log(isPalindrome('level'));
console.log(isPalindrome('hello'));

module.exports = { lastItem, secondToLast, lastChar, isPalindrome };
