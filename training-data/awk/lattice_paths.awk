# Lattice paths with a DP row.
BEGIN {
  n = 3
  for (j = 0; j <= n; j++) row[j] = 1
  for (k = 1; k <= n; k++) for (j = 1; j <= n; j++) row[j] += row[j - 1]
  print row[n]
}
