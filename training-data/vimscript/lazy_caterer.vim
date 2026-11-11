" Lazy caterer sequence: max pieces from n cuts
function! Term(n) abort
  return ((a:n * (a:n + 1))/2) + 1
endfunction

echo join(map(range(10), 'Term(v:val)'), ' ')
