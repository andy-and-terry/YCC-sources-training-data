" Pernicious numbers: the popcount is prime.
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

function! Popcount(n)
  let l:m = a:n
  let l:c = 0
  while l:m > 0
    let l:c += l:m % 2
    let l:m = l:m / 2
  endwhile
  return l:c
endfunction

echo join(filter(range(1, 20), 'IsPrime(Popcount(v:val))'), ' ')
