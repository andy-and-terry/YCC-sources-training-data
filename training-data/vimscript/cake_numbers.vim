function! Cake(n) abort
  return (a:n * a:n * a:n + 5 * a:n + 6) / 6
endfunction

echo join(map(range(10), 'Cake(v:val)'), ' ')
" Expected output: 1 2 4 8 15 26 42 64 93 130
