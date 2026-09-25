type Grid = boolean[][];

export function step(g: Grid, wrap = true): Grid {
  const h = g.length, w = g[0].length;
  const alive = (r: number, c: number): number => {
    if (wrap) return g[(r + h) % h][(c + w) % w] ? 1 : 0;
    return r >= 0 && r < h && c >= 0 && c < w && g[r][c] ? 1 : 0;
  };
  return g.map((row, r) =>
    row.map((cell, c) => {
      let n = 0;
      for (let dr = -1; dr <= 1; dr++) for (let dc = -1; dc <= 1; dc++) if (dr || dc) n += alive(r + dr, c + dc);
      return n === 3 || (cell && n === 2);
    }),
  );
}

const parse = (rows: string[]): Grid => rows.map((r) => [...r].map((ch) => ch === "#"));
const show = (g: Grid): string => g.map((r) => r.map((x) => (x ? "#" : ".")).join("")).join("\n");

let g = parse([".....", "..#..", "..#..", "..#..", "....."]);
for (let i = 0; i < 3; i++) {
  console.log(`gen ${i}\n${show(g)}\n`);
  g = step(g);
}
