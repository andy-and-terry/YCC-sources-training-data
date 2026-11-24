" Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
let s:r = 0
for s:n in range(1, 8)
  let s:r = s:r * 10 + 1
  echo s:r . (s:r % 3 == 0 ? '  (divisible by 3)' : '')
endfor
