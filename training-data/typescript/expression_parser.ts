type Expr =
  | { kind: "num"; value: number }
  | { kind: "var"; name: string }
  | { kind: "neg"; arg: Expr }
  | { kind: "bin"; op: "+" | "-" | "*" | "/" | "^"; left: Expr; right: Expr };

export function parse(text: string): Expr {
  const tokens = text.match(/\d+\.?\d*|[a-z]\w*|[-+*/^()]/gi) ?? [];
  let i = 0;
  const peek = (): string | undefined => tokens[i];
  const take = (): string | undefined => tokens[i++];

  const expr = (): Expr => {
    let node = term();
    while (peek() === "+" || peek() === "-") node = { kind: "bin", op: take() as "+" | "-", left: node, right: term() };
    return node;
  };
  const term = (): Expr => {
    let node = power();
    while (peek() === "*" || peek() === "/") node = { kind: "bin", op: take() as "*" | "/", left: node, right: power() };
    return node;
  };
  const power = (): Expr => {
    const base = unary();
    if (peek() !== "^") return base;
    take();
    return { kind: "bin", op: "^", left: base, right: power() };
  };
  const unary = (): Expr => (peek() === "-" ? (take(), { kind: "neg", arg: unary() }) : primary());
  const primary = (): Expr => {
    const t = take();
    if (t === "(") {
      const e = expr();
      if (take() !== ")") throw new SyntaxError("expected )");
      return e;
    }
    if (t === undefined) throw new SyntaxError("unexpected end");
    return /^\d/.test(t) ? { kind: "num", value: Number(t) } : { kind: "var", name: t };
  };

  const e = expr();
  if (i !== tokens.length) throw new SyntaxError(`trailing '${peek()}'`);
  return e;
}

export function evaluate(e: Expr, env: Record<string, number> = {}): number {
  switch (e.kind) {
    case "num": return e.value;
    case "var":
      if (!(e.name in env)) throw new ReferenceError(e.name);
      return env[e.name];
    case "neg": return -evaluate(e.arg, env);
    case "bin": {
      const a = evaluate(e.left, env), b = evaluate(e.right, env);
      switch (e.op) {
        case "+": return a + b;
        case "-": return a - b;
        case "*": return a * b;
        case "/": return a / b;
        case "^": return a ** b;
      }
    }
  }
}

for (const src of ["1 + 2 * 3", "2 ^ 3 ^ 2", "-(x + 3) * y"]) console.log(src, "=", evaluate(parse(src), { x: 2, y: 4 }));
