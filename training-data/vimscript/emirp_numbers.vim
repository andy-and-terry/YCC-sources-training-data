" Emirps: primes whose digit reversal is a different prime.
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

function! ReverseNum(n)
  return str2nr(join(reverse(split(a:n . '', '\zs')), ''))
endfunction

let s:out = []
for s:n in range(2, 199)
  let s:r = ReverseNum(s:n)
  if s:r != s:n && IsPrime(s:n) && IsPrime(s:r)
    call add(s:out, s:n)
  endif
endfor
echo join(s:out, ' ')
