let n = 8
for r in range(n)
  let line = repeat(' ', n - r - 1)
  for c in range(r + 1)
    let line .= and(r, c) == c ? '* ' : '  '
  endfor
  echo line
endfor
