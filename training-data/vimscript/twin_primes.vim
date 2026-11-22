" Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
function! IsPrime(n)
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
for s:p in range(2, 99)
  if IsPrime(s:p) && IsPrime(s:p + 2)
    call add(s:out, s:p)
  endif
endfor
echo join(s:out, ' ')
