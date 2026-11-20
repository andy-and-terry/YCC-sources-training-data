// Monotone lattice paths through an n x n grid using one DP row.
function latticePaths(n) {
  const row = new Array(n + 1).fill(1);
  for (let i = 0; i < n; i++) for (let j = 1; j <= n; j++) row[j] += row[j - 1];
  return row[n];
}
console.log(latticePaths(3));
