" Fermat primality test; Carmichael number 561 fools it.
function! PowMod(b, e, m) abort
  let l:r = 1
  let l:b = a:b % a:m
  let l:e = a:e
  while l:e > 0
    if l:e % 2 == 1
      let l:r = l:r * l:b % a:m
    endif
    let l:b = l:b * l:b % a:m
    let l:e = l:e / 2
  endwhile
  return l:r
endfunction

function! ProbablyPrime(n) abort
  return a:n > 2 && PowMod(2, a:n - 1, a:n) == 1
endfunction

for s:n in [97, 91, 561]
  echo s:n ProbablyPrime(s:n) ? 'true' : 'false'
endfor
