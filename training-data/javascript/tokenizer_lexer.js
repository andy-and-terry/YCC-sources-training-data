const SPEC = [
  ["NUMBER", /\d+(?:\.\d+)?/y],
  ["STRING", /"(?:[^"\\]|\\.)*"/y],
  ["IDENT", /[A-Za-z_]\w*/y],
  ["OP", /==|!=|<=|>=|=>|[+\-*/=<>(){};,]/y],
  ["NEWLINE", /\n/y],
  ["SKIP", /[ \t]+/y],
  ["COMMENT", /\/\/[^\n]*/y],
];
const KEYWORDS = new Set(["let", "const", "if", "else", "while", "return", "function"]);

function* tokenize(src) {
  let pos = 0, line = 1, lineStart = 0;
  outer: while (pos < src.length) {
    for (const [kind, re] of SPEC) {
      re.lastIndex = pos;
      const m = re.exec(src);
      if (!m) continue;
      const value = m[0];
      const col = pos - lineStart + 1;
      pos += value.length;
      if (kind === "NEWLINE") { line++; lineStart = pos; continue outer; }
      if (kind === "SKIP" || kind === "COMMENT") continue outer;
      yield { kind: kind === "IDENT" && KEYWORDS.has(value) ? "KEYWORD" : kind, value, line, col };
      continue outer;
    }
    throw new SyntaxError(`unexpected '${src[pos]}' at ${line}:${pos - lineStart + 1}`);
  }
}

const code = 'let x = 3.5 * (y + 2); // comment\nif (x >= 10) { print("big"); }';
for (const t of tokenize(code)) console.log(`${t.line}:${t.col}\t${t.kind}\t${t.value}`);
module.exports = { tokenize };
