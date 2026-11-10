function! Sigma(n) abort
  let s = 0
  for d in range(1, a:n)
    if a:n % d == 0 | let s += d | endif
  endfor
  return s
endfunction

echo join(filter(range(1, 99), 'Sigma(Sigma(v:val)) == 2 * v:val'), ' ')
" Expected output: 2 4 16 64
