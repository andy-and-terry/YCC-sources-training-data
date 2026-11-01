{
  for (i = 1; i <= NF; i++) cell[NR, i] = $i
  if (NF > cols) cols = NF
}
END {
  for (i = 1; i <= cols; i++) {
    row = cell[1, i]
    for (j = 2; j <= NR; j++) row = row " " cell[j, i]
    print row
  }
}
