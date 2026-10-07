function floodFill(image: number[][], sr: number, sc: number, color: number): number[][] {
  const original = image[sr][sc];
  if (original === color) return image;
  const stack: [number, number][] = [[sr, sc]];

  while (stack.length > 0) {
    const [r, c] = stack.pop()!;
    if (r < 0 || c < 0 || r >= image.length || c >= image[0].length) continue;
    if (image[r][c] !== original) continue;
    image[r][c] = color;
    stack.push([r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]);
  }
  return image;
}

const img = [
  [1, 1, 0],
  [1, 0, 0],
  [1, 1, 1],
];
console.log(floodFill(img, 0, 0, 7).map((row) => row.join(" ")).join("\n"));
