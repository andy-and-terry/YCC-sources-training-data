function pascal(n) {
  const rows = [];
  for (let i = 0; i < n; i++) {
    const row = Array(i + 1).fill(1);
    for (let j = 1; j < i; j++) row[j] = rows[i - 1][j - 1] + rows[i - 1][j];
    rows.push(row);
  }
  return rows;
}

pascal(6).forEach((r) => console.log(r.join(" ")));
module.exports = { pascal };
