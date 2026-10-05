function pascalTriangle(rows: number): number[][] {
  const triangle: number[][] = [];
  for (let r = 0; r < rows; r++) {
    const row = new Array<number>(r + 1).fill(1);
    for (let c = 1; c < r; c++) {
      row[c] = triangle[r - 1][c - 1] + triangle[r - 1][c];
    }
    triangle.push(row);
  }
  return triangle;
}

for (const row of pascalTriangle(6)) {
  console.log(row.join(" "));
}
