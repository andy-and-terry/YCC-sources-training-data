" Circular primes below 100; expect 13.
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

function! Main() abort
  let c = 0
  for n in range(2, 99)
    let s = string(n)
    let ok = 1
    for i in range(len(s))
      if !IsPrime(str2nr(strpart(s, i) . strpart(s, 0, i)))
        let ok = 0
      endif
    endfor
    let c += ok
  endfor
  echo c
endfunction

call Main()
