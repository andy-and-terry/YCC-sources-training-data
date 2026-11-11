" Repunits: numbers made only of the digit 1.
function! Repunits(count) abort
  let l:r = 0
  let l:out = []
  for l:i in range(a:count)
    let l:r = l:r * 10 + 1
    call add(l:out, l:r)
  endfor
  return l:out
endfunction

echo Repunits(5)
