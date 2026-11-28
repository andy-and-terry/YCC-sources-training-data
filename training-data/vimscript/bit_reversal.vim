function! ReverseBits(v) abort
  let l:v = a:v
  let l:r = 0
  for l:i in range(8)
    let l:r = or(l:r * 2, and(l:v, 1))
    let l:v = l:v / 2
  endfor
  return l:r
endfunction

for s:v in [1, 6, 13, 128]
  echo s:v ReverseBits(s:v) " 128 96 176 1
endfor
