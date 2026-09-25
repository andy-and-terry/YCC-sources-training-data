export function compress(s: string): string {
  if (!s) return s;
  const parts: string[] = [];
  let count = 1;
  for (let i = 1; i <= s.length; i++) {
    if (s[i] === s[i - 1]) count++;
    else {
      parts.push(`${s[i - 1]}${count}`);
      count = 1;
    }
  }
  const out = parts.join("");
  return out.length < s.length ? out : s;
}

export function decompress(s: string): string {
  return s.replace(/(\D)(\d+)/g, (_, ch: string, n: string) => ch.repeat(Number(n)));
}

for (const w of ["aabcccccaaa", "abc", "zzzzzzzzzz"]) {
  const c = compress(w);
  console.log(w, "->", c, c !== w ? `(round-trip ${decompress(c) === w})` : "");
}
