function spiral(n) {
  const grid = Array.from({ length: n }, () => Array(n).fill(0));
  let [top, left, bottom, right, k] = [0, 0, n - 1, n - 1, 1];
  while (top <= bottom && left <= right) {
    for (let c = left; c <= right; c++) grid[top][c] = k++;
    top++;
    for (let r = top; r <= bottom; r++) grid[r][right] = k++;
    right--;
    if (top <= bottom) { for (let c = right; c >= left; c--) grid[bottom][c] = k++; bottom--; }
    if (left <= right) { for (let r = bottom; r >= top; r--) grid[r][left] = k++; left++; }
  }
  return grid;
}

spiral(4).forEach((row) => console.log(row.map((v) => String(v).padStart(2)).join(" ")));
