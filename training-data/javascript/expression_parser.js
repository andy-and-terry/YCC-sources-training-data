// Recursive-descent parser that builds an AST, then evaluates it.
function parse(text) {
  const tokens = text.match(/\d+\.?\d*|[-+*/^()]/g) || [];
  let i = 0;
  const peek = () => tokens[i];
  const take = () => tokens[i++];

  function expr() {
    let node = term();
    while (peek() === "+" || peek() === "-") node = { op: take(), left: node, right: term() };
    return node;
  }
  function term() {
    let node = power();
    while (peek() === "*" || peek() === "/") node = { op: take(), left: node, right: power() };
    return node;
  }
  function power() {
    const base = unary();
    if (peek() === "^") { take(); return { op: "^", left: base, right: power() }; }
    return base;
  }
  function unary() {
    if (peek() === "-") { take(); return { op: "neg", arg: unary() }; }
    return primary();
  }
  function primary() {
    const tok = take();
    if (tok === "(") {
      const node = expr();
      if (take() !== ")") throw new SyntaxError("expected )");
      return node;
    }
    if (tok === undefined || isNaN(tok)) throw new SyntaxError(`unexpected ${tok}`);
    return { num: Number(tok) };
  }

  const ast = expr();
  if (i !== tokens.length) throw new SyntaxError(`trailing ${peek()}`);
  return ast;
}

function evaluate(n) {
  if ("num" in n) return n.num;
  if (n.op === "neg") return -evaluate(n.arg);
  const a = evaluate(n.left), b = evaluate(n.right);
  return { "+": a + b, "-": a - b, "*": a * b, "/": a / b, "^": a ** b }[n.op];
}

for (const e of ["1 + 2 * 3", "(1 + 2) * 3", "2 ^ 3 ^ 2", "-4 + 10 / 4", "-(2 + 3) * 2"]) {
  console.log(e, "=", evaluate(parse(e)));
}
module.exports = { parse, evaluate };
