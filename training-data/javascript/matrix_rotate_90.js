function rotateClockwise(m) {
  const n = m.length;
  for (let i = 0; i < n; i++) for (let j = i + 1; j < n; j++) [m[i][j], m[j][i]] = [m[j][i], m[i][j]];
  for (const row of m) row.reverse();
  return m;
}

const rotateCounter = (m) => m[0].map((_, c) => m.map((row) => row[c])).reverse();

const m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
console.log(rotateClockwise(m.map((r) => [...r])));
console.log(rotateCounter(m));
module.exports = { rotateClockwise, rotateCounter };
