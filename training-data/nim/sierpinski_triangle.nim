let n = 8
for r in 0 ..< n:
  var line = ' '.repeat(n - r - 1)
  for c in 0 .. r:
    line.add(if (r and c) == c: "* " else: "  ")
  echo line
