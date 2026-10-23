function magicSquare(n) {
  const sq = Array.from({ length: n }, () => Array(n).fill(0));
  let r = 0;
  let c = Math.floor(n / 2);
  for (let k = 1; k <= n * n; k++) {
    sq[r][c] = k;
    let nr = (r - 1 + n) % n;
    let nc = (c + 1) % n;
    if (sq[nr][nc] !== 0) {
      nr = (r + 1) % n;
      nc = c;
    }
    [r, c] = [nr, nc];
  }
  return sq;
}

for (const row of magicSquare(5)) console.log(row.map((v) => String(v).padStart(3)).join(""));
