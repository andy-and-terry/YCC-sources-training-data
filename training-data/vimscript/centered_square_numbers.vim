" Centered square numbers 2n(n+1)+1
function! Term(n) abort
  return ((2 * a:n) * (a:n + 1)) + 1
endfunction

echo join(map(range(10), 'Term(v:val)'), ' ')
