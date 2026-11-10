function! Pieces(cuts) abort
  return (a:cuts * a:cuts + a:cuts + 2) / 2
endfunction

echo join(map(range(10), 'Pieces(v:val)'), ' ')
" Expected output: 1 2 4 7 11 16 22 29 37 46
