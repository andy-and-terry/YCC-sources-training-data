" Leyland numbers: x^y + y^x for x >= y >= 2.
function! Ipow(b, e)
  let l:r = 1
  for l:i in range(a:e)
    let l:r = l:r * a:b
  endfor
  return l:r
endfunction

let s:vals = []
for s:x in range(2, 4)
  for s:y in range(2, s:x)
    call add(s:vals, Ipow(s:x, s:y) + Ipow(s:y, s:x))
  endfor
endfor
echo join(s:vals, ' ')
