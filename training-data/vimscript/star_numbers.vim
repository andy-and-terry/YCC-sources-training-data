" 6n(n-1)+1
function! Term(n) abort
  let n = a:n
  return ((6 * n) * (n - 1)) + 1
endfunction

for n in range(1, 15)
  echo printf('%2d -> %d', n, Term(n))
endfor
