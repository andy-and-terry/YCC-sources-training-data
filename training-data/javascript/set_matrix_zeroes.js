function setZeroes(m) {
  const rows = new Set(), cols = new Set();
  m.forEach((row, r) => row.forEach((v, c) => { if (v === 0) { rows.add(r); cols.add(c); } }));
  m.forEach((row, r) => row.forEach((_, c) => { if (rows.has(r) || cols.has(c)) row[c] = 0; }));
  return m;
}

console.log(setZeroes([[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]));
module.exports = { setZeroes };
