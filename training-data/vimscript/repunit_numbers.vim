" Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
let s:r = 0
let s:out = []
for s:i in range(8)
  let s:r = s:r * 10 + 1
  call add(s:out, s:r)
endfor
echo join(s:out, ' ')
