function saddlePoints(matrix) {
  if (!matrix.length) return [];
  const colMins = matrix[0].map((_, c) => Math.min(...matrix.map((row) => row[c])));
  const out = [];
  matrix.forEach((row, r) => {
    const rowMax = Math.max(...row);
    row.forEach((v, c) => { if (v === rowMax && v === colMins[c]) out.push([r, c]); });
  });
  return out;
}

console.log(saddlePoints([[9, 8, 7], [5, 3, 2], [6, 6, 7]]));
