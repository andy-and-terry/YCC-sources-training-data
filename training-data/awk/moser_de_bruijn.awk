# Read binary digits of i as base-4 digits.
function moser_de_bruijn(i,   v, p) {
  v = 0; p = 1
  while (i > 0) {
    if (i % 2 == 1) v += p
    p *= 4
    i = int(i / 2)
  }
  return v
}
BEGIN {
  for (i = 0; i < 10; i++) printf "%d ", moser_de_bruijn(i)
  print "" # 0 1 4 5 16 17 20 21 64 65
}
