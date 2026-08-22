function encode(s) {
  if (!s) return '';
  let result = '';
  let count = 1;
  for (let i = 1; i <= s.length; i++) {
    if (i < s.length && s[i] === s[i - 1]) {
      count++;
    } else {
      result += s[i - 1] + count;
      count = 1;
    }
  }
  return result;
}

function decode(s) {
  let result = '';
  let i = 0;
  while (i < s.length) {
    const char = s[i];
    let j = i + 1;
    while (j < s.length && /\d/.test(s[j])) j++;
    result += char.repeat(Number(s.slice(i + 1, j)));
    i = j;
  }
  return result;
}

const encoded = encode('aaabbbccd');
console.log(encoded);
console.log(decode(encoded));

module.exports = { encode, decode };
