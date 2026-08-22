function tokenize(expr) {
  return expr.match(/\d+\.\d+|\d+|[()+\-*/]/g).map((tok) => (/^[\d.]+$/.test(tok) ? Number(tok) : tok));
}

function toPostfix(tokens) {
  const precedence = { '+': 1, '-': 1, '*': 2, '/': 2 };
  const output = [];
  const ops = [];
  for (const tok of tokens) {
    if (typeof tok === 'number') {
      output.push(tok);
    } else if (tok === '(') {
      ops.push(tok);
    } else if (tok === ')') {
      while (ops.at(-1) !== '(') output.push(ops.pop());
      ops.pop();
    } else {
      while (ops.length && ops.at(-1) !== '(' && precedence[ops.at(-1)] >= precedence[tok]) {
        output.push(ops.pop());
      }
      ops.push(tok);
    }
  }
  while (ops.length) output.push(ops.pop());
  return output;
}

function evalPostfix(postfix) {
  const stack = [];
  const ops = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
    '/': (a, b) => a / b,
  };
  for (const tok of postfix) {
    if (typeof tok === 'number') {
      stack.push(tok);
    } else {
      const b = stack.pop();
      const a = stack.pop();
      stack.push(ops[tok](a, b));
    }
  }
  return stack[0];
}

function calculate(expr) {
  return evalPostfix(toPostfix(tokenize(expr)));
}

console.log(calculate('3 + 4 * (2 - 1)'));
module.exports = { calculate };
