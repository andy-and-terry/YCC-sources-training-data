" Pronic numbers n(n+1)
function! Term(n) abort
  return a:n * (a:n + 1)
endfunction

echo join(map(range(10), 'Term(v:val)'), ' ')
