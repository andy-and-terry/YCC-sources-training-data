export function setZeroes(m: number[][]): number[][] {
  const zeroRows = new Set<number>();
  const zeroCols = new Set<number>();
  m.forEach((row, r) =>
    row.forEach((v, c) => {
      if (v === 0) {
        zeroRows.add(r);
        zeroCols.add(c);
      }
    }),
  );
  return m.map((row, r) => row.map((v, c) => (zeroRows.has(r) || zeroCols.has(c) ? 0 : v)));
}

console.table(setZeroes([[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]));
