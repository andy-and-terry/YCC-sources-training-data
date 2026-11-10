function! Tau(n) abort
  let c = 0
  for d in range(1, a:n)
    if a:n % d == 0 | let c += 1 | endif
  endfor
  return c
endfunction

echo join(filter(range(1, 59), 'v:val % Tau(v:val) == 0'), ' ')
" Expected output: 1 2 8 9 12 18 24 36 40 56
