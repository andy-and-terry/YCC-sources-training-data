function pieces(c) { return int((c * c + c + 2) / 2) }
BEGIN {
  for (n = 0; n < 10; n++) printf "%d ", pieces(n)
  print "" # 1 2 4 7 11 16 22 29 37 46
}
