// Monotone lattice paths with a rolling DP row.
function latticePaths(n: number): number {
  const row: number[] = new Array(n + 1).fill(1);
  for (let i = 0; i < n; i++) for (let j = 1; j <= n; j++) row[j] += row[j - 1];
  return row[n];
}
console.log(latticePaths(3));
