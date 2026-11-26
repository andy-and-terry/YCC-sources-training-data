" Primorials up to 1e6, including 1; expect 8 values.
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
  let values = [1]
  let acc = 1
  let p = 2
  while 1
    if IsPrime(p)
      let acc = acc * p
      if acc > 1000000
        break
      endif
      call add(values, acc)
    endif
    let p += 1
  endwhile
  echo len(values)
endfunction

call Main()
