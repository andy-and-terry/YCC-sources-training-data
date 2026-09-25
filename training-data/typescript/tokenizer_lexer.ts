export type TokenKind = "NUMBER" | "STRING" | "IDENT" | "KEYWORD" | "OP";
export interface Token { kind: TokenKind; value: string; line: number; col: number }

const RULES: ReadonlyArray<[TokenKind | "SKIP" | "NEWLINE", RegExp]> = [
  ["NUMBER", /\d+(?:\.\d+)?/y],
  ["STRING", /"(?:[^"\\]|\\.)*"/y],
  ["IDENT", /[A-Za-z_]\w*/y],
  ["OP", /==|!=|<=|>=|=>|[+\-*/=<>(){};,:]/y],
  ["NEWLINE", /\n/y],
  ["SKIP", /[ \t]+|\/\/[^\n]*/y],
];
const KEYWORDS = new Set(["let", "const", "if", "else", "while", "return", "function"]);

export function tokenize(src: string): Token[] {
  const out: Token[] = [];
  let pos = 0, line = 1, lineStart = 0;
  scan: while (pos < src.length) {
    for (const [kind, re] of RULES) {
      re.lastIndex = pos;
      const m = re.exec(src);
      if (!m) continue;
      const col = pos - lineStart + 1;
      pos += m[0].length;
      if (kind === "NEWLINE") { line++; lineStart = pos; }
      else if (kind !== "SKIP") {
        out.push({ kind: kind === "IDENT" && KEYWORDS.has(m[0]) ? "KEYWORD" : kind, value: m[0], line, col });
      }
      continue scan;
    }
    throw new SyntaxError(`unexpected '${src[pos]}' at ${line}:${pos - lineStart + 1}`);
  }
  return out;
}

const code = 'const x: number = 3.5 * (y + 2); // note\nif (x >= 10) { log("big"); }';
for (const t of tokenize(code)) console.log(`${t.line}:${t.col}\t${t.kind.padEnd(7)} ${t.value}`);
