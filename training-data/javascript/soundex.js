const CODES = { b: 1, f: 1, p: 1, v: 1, c: 2, g: 2, j: 2, k: 2, q: 2, s: 2, x: 2, z: 2, d: 3, t: 3, l: 4, m: 5, n: 5, r: 6 };

function soundex(word) {
  const w = word.toLowerCase();
  let out = w[0].toUpperCase();
  let last = CODES[w[0]];
  for (const ch of w.slice(1)) {
    const code = CODES[ch];
    if (code && code !== last) out += code;
    if (ch !== "h" && ch !== "w") last = code;
  }
  return out.padEnd(4, "0").slice(0, 4);
}

for (const n of ["Robert", "Rupert", "Tymczak", "Pfister", "Honeyman"]) {
  console.log(n, soundex(n));
}
