function longestValid(s) {
  const stack = [-1];
  let best = 0;
  for (let i = 0; i < s.length; i++) {
    if (s[i] === "(") stack.push(i);
    else {
      stack.pop();
      if (stack.length === 0) stack.push(i);
      else best = Math.max(best, i - stack.at(-1));
    }
  }
  return best;
}

for (const s of ["(()", ")()())", "", "()(()", "((()))()"]) console.log(JSON.stringify(s), longestValid(s));
module.exports = { longestValid };
