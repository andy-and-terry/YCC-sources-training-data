function! IsPrime(n) abort
  if a:n < 2
    return 0
  endif
  let l:d = 2
  while l:d * l:d <= a:n
    if a:n % l:d == 0
      return 0
    endif
    let l:d += 1
  endwhile
  return 1
endfunction

let s:n = 28
for s:p in range(2, s:n / 2)
  if IsPrime(s:p) && IsPrime(s:n - s:p)
    echo s:p . ' + ' . (s:n - s:p)
  endif
endfor
