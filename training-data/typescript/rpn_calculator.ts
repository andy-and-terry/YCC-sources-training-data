function evaluateRPN(tokens: string[]): number {
  const stack: number[] = [];
  const ops: Record<string, (a: number, b: number) => number> = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
    '/': (a, b) => a / b,
  };
  for (const tok of tokens) {
    if (tok in ops) {
      const b = stack.pop()!;
      const a = stack.pop()!;
      stack.push(ops[tok](a, b));
    } else {
      stack.push(Number(tok));
    }
  }
  return stack[0];
}

console.log(evaluateRPN(['3', '4', '+', '2', '*']));
