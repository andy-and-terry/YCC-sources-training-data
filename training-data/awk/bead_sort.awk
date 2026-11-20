# Bead (gravity) sort. Run: awk -f bead_sort.awk
BEGIN {
  n = split("5 3 1 4 2", nums, " ")
  max = 5
  for (i = 1; i <= max; i++) cols[i] = 0
  for (k = 1; k <= n; k++) for (i = 1; i <= nums[k]; i++) cols[i]++
  out = ""
  for (r = 1; r <= n; r++) {
    c = 0
    for (i = 1; i <= max; i++) if (cols[i] >= r) c++
    out = c (out == "" ? "" : " ") out
  }
  print out
}
