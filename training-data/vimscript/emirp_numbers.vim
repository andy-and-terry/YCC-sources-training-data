" Emirps: primes whose digit reversal is a different prime.
function! IsPrime(n) abort
  if a:n < 2
    return 0
  endif
  let l:i = 2
  while l:i * l:i <= a:n
    if a:n % l:i == 0
      return 0
    endif
    let l:i += 1
  endwhile
  return 1
endfunction

function! ReverseDigits(n) abort
  return str2nr(join(reverse(split(string(a:n), '\zs')), ''))
endfunction

let s:emirps = filter(range(2, 99),
      \ {_, n -> ReverseDigits(n) != n && IsPrime(n) && IsPrime(ReverseDigits(n))})
echo s:emirps
