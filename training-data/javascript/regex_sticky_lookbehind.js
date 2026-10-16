const prices = "cost: $45, tax: $5, total: EUR 50";
console.log(prices.match(/(?<=\$)\d+/g));
console.log(prices.match(/(?<!\$)\b\d+/g));
console.log("foobar foobaz".match(/foo(?=baz)/).index);

const tokenizer = /\s*(?:(\d+)|([+\-*/]))/y;
const input = "12 + 34 * 5";
const tokens = [];
let m;
while (tokenizer.lastIndex < input.length && (m = tokenizer.exec(input))) {
  tokens.push(m[1] !== undefined ? { num: Number(m[1]) } : { op: m[2] });
}
console.log(tokens);
