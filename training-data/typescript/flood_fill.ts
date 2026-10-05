type Grid = number[][];

function floodFill(image: Grid, row: number, col: number, color: number): Grid {
  const result = image.map((r) => [...r]);
  const original = result[row][col];
  if (original === color) return result;

  const stack: Array<[number, number]> = [[row, col]];
  while (stack.length > 0) {
    const [r, c] = stack.pop()!;
    if (r < 0 || r >= result.length || c < 0 || c >= result[r].length) continue;
    if (result[r][c] !== original) continue;
    result[r][c] = color;
    stack.push([r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]);
  }
  return result;
}

console.log(floodFill([[1, 1, 0], [1, 0, 0], [1, 1, 1]], 0, 0, 7));
