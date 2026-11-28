function! Chebyshev(a, b) abort
  let l:m = 0
  for l:i in range(len(a:a))
    let l:m = max([l:m, abs(a:a[l:i] - a:b[l:i])])
  endfor
  return l:m
endfunction

echo Chebyshev([1, 2], [4, 6])
