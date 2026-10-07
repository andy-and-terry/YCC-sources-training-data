const PREC = { "+": 1, "-": 1, "*": 2, "/": 2, "^": 3 };
const RIGHT = new Set(["^"]);
const OPS = {
  "+": (a, b) => a + b,
  "-": (a, b) => a - b,
  "*": (a, b) => a * b,
  "/": (a, b) => a / b,
  "^": (a, b) => a ** b,
};

function toRpn(tokens) {
  const out = [], ops = [];
  for (const t of tokens) {
    if (!isNaN(t)) out.push(t);
    else if (t in PREC) {
      while (ops.length && ops.at(-1) in PREC &&
        (PREC[ops.at(-1)] > PREC[t] || (PREC[ops.at(-1)] === PREC[t] && !RIGHT.has(t)))) {
        out.push(ops.pop());
      }
      ops.push(t);
    } else if (t === "(") ops.push(t);
    else if (t === ")") {
      while (ops.at(-1) !== "(") out.push(ops.pop());
      ops.pop();
    }
  }
  return out.concat(ops.reverse());
}

function evalRpn(rpn) {
  const st = [];
  for (const t of rpn) {
    if (t in OPS) {
      const b = st.pop(), a = st.pop();
      st.push(OPS[t](a, b));
    } else st.push(Number(t));
  }
  return st[0];
}

const rpn = toRpn("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3".split(" "));
console.log(rpn.join(" "));
console.log(evalRpn(rpn));
module.exports = { toRpn, evalRpn };
