function! Sigma(n) abort
  let l:s = 0
  for l:d in range(1, a:n)
    if a:n % l:d == 0
      let l:s += l:d
    endif
  endfor
  return l:s
endfunction

echo filter(range(1, 20), 'Sigma(v:val) < 2 * v:val')
