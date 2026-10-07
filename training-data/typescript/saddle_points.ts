export interface Point { row: number; column: number }

export function saddlePoints(m: number[][]): Point[] {
  if (m.length === 0) return [];
  const rowMax = m.map((row) => Math.max(...row));
  const colMin = m[0].map((_, c) => Math.min(...m.map((row) => row[c])));
  const result: Point[] = [];
  m.forEach((row, r) => row.forEach((v, c) => {
    if (v === rowMax[r] && v === colMin[c]) result.push({ row: r + 1, column: c + 1 });
  }));
  return result;
}

console.log(saddlePoints([[9, 8, 7], [5, 3, 2], [6, 6, 7]]));
