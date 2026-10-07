type Square = `${"a" | "b" | "c" | "d" | "e" | "f" | "g" | "h"}${1 | 2 | 3 | 4 | 5 | 6 | 7 | 8}`;
const MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]] as const;

const toXY = (s: Square): [number, number] => [s.charCodeAt(0) - 97, Number(s[1]) - 1];
const toSq = (x: number, y: number): Square => `${String.fromCharCode(97 + x)}${y + 1}` as Square;

export function knightPath(from: Square, to: Square): Square[] {
  const prev = new Map<Square, Square | null>([[from, null]]);
  const queue: Square[] = [from];
  for (let head = 0; head < queue.length; head++) {
    const cur = queue[head];
    if (cur === to) break;
    const [x, y] = toXY(cur);
    for (const [dx, dy] of MOVES) {
      const nx = x + dx, ny = y + dy;
      if (nx < 0 || nx > 7 || ny < 0 || ny > 7) continue;
      const sq = toSq(nx, ny);
      if (!prev.has(sq)) {
        prev.set(sq, cur);
        queue.push(sq);
      }
    }
  }
  const path: Square[] = [];
  for (let s: Square | null | undefined = to; s; s = prev.get(s)) path.unshift(s);
  return path;
}

console.log(knightPath("a1", "h8"));
console.log(knightPath("a1", "b2").length - 1, "moves");
