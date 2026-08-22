function reverseString(s) {
  return [...s].reverse().join('');
}

function reverseWords(s) {
  return s.split(' ').reverse().join(' ');
}

console.log(reverseString('hello'));
console.log(reverseWords('the quick brown fox'));

module.exports = { reverseString, reverseWords };
