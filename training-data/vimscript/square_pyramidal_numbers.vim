" n(n+1)(2n+1)/6
function! Term(n) abort
  let n = a:n
  return ((n * (n + 1)) * ((2 * n) + 1)) / 6
endfunction

for n in range(1, 15)
  echo printf('%2d -> %d', n, Term(n))
endfor
