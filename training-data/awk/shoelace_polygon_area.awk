# Shoelace polygon area.
BEGIN {
  split("0 4 4 0", x, " "); split("0 0 3 3", y, " ")
  n = 4; s = 0
  for (i = 1; i <= n; i++) { j = i % n + 1; s += x[i] * y[j] - x[j] * y[i] }
  if (s < 0) s = -s
  print s / 2
}
