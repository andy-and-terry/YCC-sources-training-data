function encode(input: string): string {
  if (input.length === 0) return '';

  let result = '';
  let count = 1;

  for (let i = 1; i <= input.length; i++) {
    if (i < input.length && input[i] === input[i - 1]) {
      count++;
    } else {
      result += `${input[i - 1]}${count}`;
      count = 1;
    }
  }

  return result;
}

function decode(input: string): string {
  let result = '';
  let i = 0;

  while (i < input.length) {
    const char = input[i];
    i++;
    let numStr = '';
    while (i < input.length && /\d/.test(input[i])) {
      numStr += input[i];
      i++;
    }
    result += char.repeat(Number(numStr));
  }

  return result;
}

const original = 'aaabbbcccc';
const encoded = encode(original);
console.log(encoded);
console.log(decode(encoded));
console.log(decode(encoded) === original);
