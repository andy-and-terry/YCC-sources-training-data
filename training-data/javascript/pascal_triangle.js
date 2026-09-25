function pascal(rows) {
  const tri = [[1]];
  for (let r = 1; r < rows; r++) {
    const prev = tri[r - 1];
    const row = [1];
    for (let i = 1; i < r; i++) row.push(prev[i - 1] + prev[i]);
    row.push(1);
    tri.push(row);
  }
  return tri;
}

const t = pascal(7);
const width = t[t.length - 1].join(" ").length;
for (const row of t) {
  const s = row.join(" ");
  const pad = Math.floor((width - s.length) / 2);
  console.log(" ".repeat(pad) + s);
}
module.exports = { pascal };
