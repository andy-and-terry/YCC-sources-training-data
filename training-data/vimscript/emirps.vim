" Emirps below 200; expect 15.
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
  for n in range(2, 199)
    let r = str2nr(join(reverse(split(string(n), '\zs')), ''))
    if r != n && IsPrime(n) && IsPrime(r)
      let c += 1
    endif
  endfor
  echo c
endfunction

call Main()
