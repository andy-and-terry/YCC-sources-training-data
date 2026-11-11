" Tetrahedral numbers n(n+1)(n+2)/6
function! Term(n) abort
  return ((a:n * (a:n + 1)) * (a:n + 2))/6
endfunction

echo join(map(range(10), 'Term(v:val)'), ' ')
