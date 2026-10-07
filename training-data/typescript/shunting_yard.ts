type Op = "+" | "-" | "*" | "/" | "^";
const PREC: Record<Op, number> = { "+": 1, "-": 1, "*": 2, "/": 2, "^": 3 };
const APPLY: Record<Op, (a: number, b: number) => number> = {
  "+": (a, b) => a + b,
  "-": (a, b) => a - b,
  "*": (a, b) => a * b,
  "/": (a, b) => a / b,
  "^": (a, b) => a ** b,
};
const isOp = (t: string): t is Op => t in PREC;

export function toRpn(tokens: string[]): string[] {
  const out: string[] = [];
  const ops: string[] = [];
  for (const t of tokens) {
    if (isOp(t)) {
      for (let top = ops.at(-1); top !== undefined && isOp(top) && (PREC[top] > PREC[t] || (PREC[top] === PREC[t] && t !== "^")); top = ops.at(-1)) {
        out.push(ops.pop()!);
      }
      ops.push(t);
    } else if (t === "(") ops.push(t);
    else if (t === ")") {
      while (ops.length && ops.at(-1) !== "(") out.push(ops.pop()!);
      if (!ops.pop()) throw new SyntaxError("mismatched parentheses");
    } else out.push(t);
  }
  while (ops.length) {
    const op = ops.pop()!;
    if (op === "(") throw new SyntaxError("mismatched parentheses");
    out.push(op);
  }
  return out;
}

export function evalRpn(rpn: string[]): number {
  const st: number[] = [];
  for (const t of rpn) {
    if (isOp(t)) {
      const b = st.pop()!, a = st.pop()!;
      st.push(APPLY[t](a, b));
    } else st.push(Number(t));
  }
  return st[0];
}

const rpn = toRpn("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3".split(" "));
console.log(rpn.join(" "), "=", evalRpn(rpn));
