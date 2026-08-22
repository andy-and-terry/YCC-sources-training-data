function reverseString(s: string): string {
  return [...s].reverse().join('');
}

function reverseWords(s: string): string {
  return s.split(' ').reverse().join(' ');
}

console.log(reverseString('hello'));
console.log(reverseWords('the quick brown fox'));
