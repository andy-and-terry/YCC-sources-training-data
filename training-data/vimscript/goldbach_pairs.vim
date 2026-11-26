" Goldbach partitions of 100; expect 6.
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
  for p in range(2, 50)
    if IsPrime(p) && IsPrime(100 - p)
      let c += 1
    endif
  endfor
  echo c
endfunction

call Main()
