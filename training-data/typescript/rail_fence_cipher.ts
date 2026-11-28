function encode(text: string, rails: number): string {
  const rows: string[][] = Array.from({ length: rails }, () => []);
  let r = 0;
  let step = 1;
  for (const ch of text) {
    rows[r].push(ch);
    if (r === 0) step = 1;
    else if (r === rails - 1) step = -1;
    r += step;
  }
  return rows.map((x) => x.join("")).join("");
}

console.log(encode("WEAREDISCOVERED", 3));
