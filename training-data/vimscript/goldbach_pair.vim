" Goldbach pair.
function! IsPrime(n) abort
  if a:n < 2 | return 0 | endif
  let d = 2
  while d * d <= a:n
    if a:n % d == 0 | return 0 | endif
    let d += 1
  endwhile
  return 1
endfunction
for p in range(2, 14)
  if IsPrime(p) && IsPrime(28 - p)
    echo p . ' + ' . (28 - p)
    break
  endif
endfor
