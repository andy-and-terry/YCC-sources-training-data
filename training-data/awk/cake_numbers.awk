function cake(n) { return int((n * n * n + 5 * n + 6) / 6) }
BEGIN {
  for (n = 0; n < 10; n++) printf "%d ", cake(n)
  print "" # 1 2 4 8 15 26 42 64 93 130
}
