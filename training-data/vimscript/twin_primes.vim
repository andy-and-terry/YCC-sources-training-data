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

let s:out = []
for s:p in range(3, 48)
  if IsPrime(s:p) && IsPrime(s:p + 2)
    call add(s:out, [s:p, s:p + 2])
  endif
endfor
echo s:out
