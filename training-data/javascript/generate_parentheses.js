function generateParentheses(n) {
  const out = [];
  (function build(s, open, close) {
    if (s.length === 2 * n) return void out.push(s);
    if (open < n) build(s + "(", open + 1, close);
    if (close < open) build(s + ")", open, close + 1);
  })("", 0, 0);
  return out;
}

console.log(generateParentheses(3));
console.log(generateParentheses(6).length);
module.exports = { generateParentheses };
