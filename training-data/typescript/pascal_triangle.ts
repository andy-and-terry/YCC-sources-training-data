export function pascal(rows: number): number[][] {
  const tri: number[][] = [];
  for (let r = 0; r < rows; r++) {
    const row = new Array<number>(r + 1).fill(1);
    for (let i = 1; i < r; i++) row[i] = tri[r - 1][i - 1] + tri[r - 1][i];
    tri.push(row);
  }
  return tri;
}

const t = pascal(7);
const width = t[t.length - 1].join(" ").length;
for (const row of t) {
  const s = row.join(" ");
  console.log(" ".repeat(Math.floor((width - s.length) / 2)) + s);
}
