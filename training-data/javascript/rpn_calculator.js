function evaluateRPN(tokens) {
  const stack = [];
  const ops = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
    '/': (a, b) => a / b,
  };
  for (const tok of tokens) {
    if (tok in ops) {
      const b = stack.pop();
      const a = stack.pop();
      stack.push(ops[tok](a, b));
    } else {
      stack.push(Number(tok));
    }
  }
  return stack[0];
}

console.log(evaluateRPN(['3', '4', '+', '2', '*']));
module.exports = { evaluateRPN };
