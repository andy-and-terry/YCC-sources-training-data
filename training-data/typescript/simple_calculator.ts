type Token = number | string;

function tokenize(expr: string): Token[] {
  const matches = expr.match(/\d+\.\d+|\d+|[()+\-*/]/g) ?? [];
  return matches.map((tok) => (/^[\d.]+$/.test(tok) ? Number(tok) : tok));
}

function toPostfix(tokens: Token[]): Token[] {
  const precedence: Record<string, number> = { '+': 1, '-': 1, '*': 2, '/': 2 };
  const output: Token[] = [];
  const ops: string[] = [];
  for (const tok of tokens) {
    if (typeof tok === 'number') {
      output.push(tok);
    } else if (tok === '(') {
      ops.push(tok);
    } else if (tok === ')') {
      while (ops[ops.length - 1] !== '(') output.push(ops.pop()!);
      ops.pop();
    } else {
      while (ops.length && ops[ops.length - 1] !== '(' && precedence[ops[ops.length - 1]] >= precedence[tok]) {
        output.push(ops.pop()!);
      }
      ops.push(tok);
    }
  }
  while (ops.length) output.push(ops.pop()!);
  return output;
}

function evalPostfix(postfix: Token[]): number {
  const stack: number[] = [];
  const ops: Record<string, (a: number, b: number) => number> = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
    '/': (a, b) => a / b,
  };
  for (const tok of postfix) {
    if (typeof tok === 'number') {
      stack.push(tok);
    } else {
      const b = stack.pop()!;
      const a = stack.pop()!;
      stack.push(ops[tok](a, b));
    }
  }
  return stack[0];
}

function calculate(expr: string): number {
  return evalPostfix(toPostfix(tokenize(expr)));
}

console.log(calculate('3 + 4 * (2 - 1)'));
